/**
 * @file hardfault.h
 * @author yuyf ()
 * @brief 
 * @version 0.1
 * @date 2026-02-10
 * 
 * @copyright Copyright (c) 2026
 * 
 * @par 修改日志:
 * <table>
 * <caption id="multi_row">$</caption>
 * <tr><th>Date       <th>Version <th>Author  <th>Description
 * <tr><td>2026-02-10 <td>v1.0     <td>yyf     <td>内容
 * </table>
 * @section 
 * @code 
 * @endcode
 */
#ifndef __hardfault_H_ //shift+U转换为大写
#define __hardfault_H_

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>

struct exception_stack_frame
{
    uint32_t exc_return;
    uint32_t r4;
    uint32_t r5;
    uint32_t r6;
    uint32_t r7;
    uint32_t r8;
    uint32_t r9;
    uint32_t r10;
    uint32_t r11;
    uint32_t r0;
    uint32_t r1;
    uint32_t r2;
    uint32_t r3;
    uint32_t r12;
    uint32_t lr;
    uint32_t pc;
    uint32_t psr;
};

#ifdef __cplusplus
}
#endif

#endif
