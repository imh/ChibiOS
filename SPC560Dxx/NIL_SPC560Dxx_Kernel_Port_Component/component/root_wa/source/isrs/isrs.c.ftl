[#ftl]
[@pp.dropOutputFile /]
[@pp.changeOutputFile name="isrs.c" /]
/*
 * This file has been generated by the NIL RTOS Kernel Port Component.
 *
 * Do not edit this file manually, any change will be lost after next
 * code generation, edit the component configuration instead.
 */

#include "components.h"
#include "isrs.h"

/**
 * @brief   Generated initialization code.
 *
 * @special
 */
void isrs_cfg_init(void) {

[#list conf.instance.isrs_configuration.isrs.isr_settings as settings]
  [#assign id = settings.identifier.value[0]?trim /]
  [#if settings.cores.value[0]??]
    [#assign cores = settings.cores.value[0]?replace(" ","")?replace("-","")?upper_case /]
    [#assign psr = "INTC_PSR_ENABLE(INTC_PSR_" + cores + ", " + settings.priority.value[0] + ")" /]
  [#else]
    [#assign psr = "INTC_PSR_ENABLE(INTC_PSR_CORE0, " + settings.priority.value[0] + ")"/]
  [/#if]
  INTC_PSR(IRQ_VECTOR_${id}) = ${psr};
[/#list]
}
