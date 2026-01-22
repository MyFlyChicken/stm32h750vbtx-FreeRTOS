#include "main.h"

static void exampleTask(void* parameters) __attribute__((noreturn));

/*-----------------------------------------------------------*/

static void exampleTask(void* parameters)
{
    (void)parameters;

    for (;;) {
        bsp_LedToggle(1);
        vTaskDelay(1000);
    }
}

int main(void)
{
    bsp_Init(); /* 硬件初始化 */

    (void)xTaskCreate(
        exampleTask, "example", configMINIMAL_STACK_SIZE, NULL, configMAX_PRIORITIES - 1U, NULL);
    userShellInit();
    /* Start the scheduler. */
    vTaskStartScheduler();

    for (;;) {
        /* Should not reach here. */
    }

    return 0;
}
