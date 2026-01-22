/**
 * @file shell_port.c
 * @author Letter (NevermindZZT@gmail.com)
 * @brief 
 * @version 0.1
 * @date 2019-02-22
 * 
 * @copyright (c) 2019 Letter
 * 
 */
#include "shell_port.h"
#include "FreeRTOS.h"
#include "bsp_uart_fifo.h"
#include "projdefs.h"
#include "task.h"
#include "semphr.h"
#include "bsp.h"

#include <stdint.h>

Shell shell;
char  shellBuffer[512];

static SemaphoreHandle_t shellMutex;
static SemaphoreHandle_t RcvbinSemaphore;
/**
 * @brief 用户shell写
 * 
 * @param data 数据
 * @param len 数据长度
 * 
 * @return short 实际写入的数据长度
 */
short userShellWrite(char* data, unsigned short len)
{
    comSendBuf(COM1, (uint8_t*)data, len);
    return len;
}

/**
 * @brief 用户shell读
 * 
 * @param data 数据
 * @param len 数据长度
 * 
 * @return short 实际读取到
 */
short userShellRead(char* data, unsigned short len)
{
    uint16_t i = 0;
    uint8_t* p = (uint8_t*)data;

    if (xSemaphoreTake(RcvbinSemaphore, portMAX_DELAY) == pdTRUE) {
        for (; i < len; i++) {
            if (!comGetChar(COM1, (uint8_t*)p)) {

                break;
            };
            p++;
        }
        return i;
    }

    return 0;
}

/**
 * @brief 用户shell上锁
 * 
 * @param shell shell
 * 
 * @return int 0
 */
int userShellLock(Shell* shell)
{
    xSemaphoreTakeRecursive(shellMutex, portMAX_DELAY);
    return 0;
}

/**
 * @brief 用户shell解锁
 * 
 * @param shell shell
 * 
 * @return int 0
 */
int userShellUnlock(Shell* shell)
{
    xSemaphoreGiveRecursive(shellMutex);
    return 0;
}

void userShellRcvCallback(uint8_t _byte)
{
    (void)_byte;

    BaseType_t xHigherPriorityTaskWoken = pdFALSE;

    xSemaphoreGiveFromISR(RcvbinSemaphore, &xHigherPriorityTaskWoken);
    portYIELD_FROM_ISR(xHigherPriorityTaskWoken);
}

/**
 * @brief 用户shell初始化
 * 
 */
void userShellInit(void)
{
    shellMutex = xSemaphoreCreateMutex();

    RcvbinSemaphore = xSemaphoreCreateBinary();

    commSetRcvCbk(COM1, userShellRcvCallback);

    shell.write  = userShellWrite;
    shell.read   = userShellRead;
    shell.lock   = userShellLock;
    shell.unlock = userShellUnlock;
    shellInit(&shell, shellBuffer, 512);
    if (xTaskCreate(shellTask, "shell", 512, &shell, 5, NULL) != pdPASS) {
        printf("shell task creat failed");
    }
}
