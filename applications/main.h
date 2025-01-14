#ifndef __main_H_ //shift+U转换为大写
#define __main_H_

#ifdef __cplusplus
extern "C" {
#endif

#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "timers.h"
#include "semphr.h"

#include "bsp.h" /* 底层硬件驱动 */
#include "shell_port.h"

#include <stdint.h>
#include <string.h>

#ifdef __cplusplus
}
#endif

#endif
