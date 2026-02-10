#include "main.h"
#include "hardfault.h"

#define FUNC_ENTRY()                                                                               \
    do {                                                                                           \
        printf("Ent: %s\r\n", __func__);                                                           \
    } while (0)

#define FUNC_EXIT()                                                                                \
    do {                                                                                           \
        printf("Exit: %s\r\n", __func__);                                                          \
    } while (0)

static void exampleTask(void* parameters) __attribute__((noreturn));

/*-----------------------------------------------------------*/

void DIV(int val)
{
    FUNC_ENTRY();
    int result = 100 / val;
    printf("rst: %d\r\n", result);
    FUNC_EXIT();
}

void A(void)
{
    FUNC_ENTRY();
    DIV(0); /* 触发除零异常 */
    FUNC_EXIT();
}

void B(void)
{
    FUNC_ENTRY();
    A();
    FUNC_EXIT();
}

void C(void)
{
    FUNC_ENTRY();
    B();
    FUNC_EXIT();
}

static void test_debug(void)
{
    //使能除0异常
    //SCB->CCR |= SCB_CCR_DIV_0_TRP_Msk;

    FUNC_ENTRY();
    C();
    FUNC_EXIT();
}

static void exampleTask(void* parameters)
{
    (void)parameters;

    test_debug(); /* 触发异常 */

    for (;;) {
        bsp_LedToggle(1);
        vTaskDelay(1000);
    }
}

void HardFault_Handler(void)
{
    extern void rt_hw_hard_fault_exception(struct exception_stack_frame * exception_info);

    // __asm volatile("TST   LR, #4\n" /* 检查 LR 位 2 */
    //                "ITE   EQ\n"
    //                "MRSEQ R0, MSP\n" /* If EQ: R0 = MSP */
    //                "MRSNE R0, PSP\n" /* If NE: R0 = PSP */

    //                "STMFD R0!, {R4-R11}\n" /* 保存上下文到 R0 指向的栈 */
    //                "STMFD R0!, {LR}\n"     /* 保存 EXC_RETURN */

    //                "TST   LR, #4\n" /* 再次检查，准备更新 SP */
    //                "ITE   EQ\n"
    //                "MSREQ MSP, R0\n" /* 注意：这里是 MSR，不是 MRS */
    //                "MSRNE PSP, R0\n" /* 注意：这里是 MSR，不是 MRS */

    //                /* IT 块在此结束，接下来的指令是无条件执行的 */
    //                "PUSH  {R4, LR}\n" /* 压入两个寄存器以保持 8 字节对齐 */
    //                "BL    rt_hw_hard_fault_exception\n"
    //                "POP   {R4, LR}\n"

    //                "ORR   LR, LR, #4\n" /* 确保返回时使用 PSP */
    //                "BX    LR\n");       /* 返回到异常发生的地址 */
    __asm volatile("TST   LR, #4\n"
                   "ITE   EQ\n"
                   "MRSEQ R0, MSP\n"
                   "MRSNE R0, PSP\n"

                   /* 手动在栈上移动 R0，为 R4-R11 和 LR 预留空间 (9个字 = 36字节) */
                   /* 然后用 STM 直接存，或者维持 STMFD 但确保 C 结构体对应 */
                   "STMFD R0!, {R4-R11, LR}\n"

                   /* 更新 SP 到新的位置，这样 C 函数处理的就是这一整块内存 */
                   "TST   LR, #4\n"
                   "ITE   EQ\n"
                   "MSREQ MSP, R0\n"
                   "MSRNE PSP, R0\n"

                   "PUSH  {R4, LR}\n"
                   "BL    rt_hw_hard_fault_exception\n"
                   "POP   {R4, LR}\n"

                   /* 恢复现场：如果需要从 HardFault 返回（通常不建议，除非是特定的异常测试） */
                   "LDMFD R0!, {R4-R11, LR}\n"
                   "TST   LR, #4\n"
                   "ITE   EQ\n"
                   "MSREQ MSP, R0\n"
                   "MSRNE PSP, R0\n"

                   "BX    LR\n"
                   :
                   :
                   : "r0", "memory" /* 显式告诉编译器 R0 被动过了 */
    );
}

int main(void)
{
    bsp_Init(); /* 硬件初始化 */

    printf("Hello\r\n");

    (void)xTaskCreate(exampleTask, "example", 2048, NULL, configMAX_PRIORITIES - 1U, NULL);
    userShellInit();
    /* Start the scheduler. */
    vTaskStartScheduler();

    for (;;) {
        /* Should not reach here. */
    }

    return 0;
}
