# Copyright (c) 2015 ARM Limited
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

if(TARGET_NXP_LPC111X_GCC_TOOLCHAIN_INCLUDED)
    return()
endif()
set(TARGET_NXP_LPC111X_GCC_TOOLCHAIN_INCLUDED 1)

# provide compatibility definitions for compiling with this target: these are
# definitions that legacy code assumes will be defined. Before adding something
# here, think VERY CAREFULLY if you can't change anywhere that relies on the
# definition that you're about to add to rely on the TARGET_LIKE_XXX
# definitions that yotta provides based on the target.json file.
#
add_definitions("-DTARGET_LPC111X -DTARGET_LPC -DTOOLCHAIN_GCC -DTOOLCHAIN_GCC_ARM")

# append non-generic flags, and set device linker script

set(_CPU_OPTIONS "-mcpu=cortex-m0 -mthumb")
set(_CPU_COMPILATION_OPTIONS "${_CPU_OPTIONS} -D__thumb2__")
set(_CPU_LINKER_SCRIPT "${CMAKE_CURRENT_LIST_DIR}/../ld/lpc1114.ld")

set(CMAKE_C_FLAGS_INIT             "${CMAKE_C_FLAGS_INIT} ${_CPU_COMPILATION_OPTIONS}")
set(CMAKE_ASM_FLAGS_INIT           "${CMAKE_ASM_FLAGS_INIT} ${_CPU_COMPILATION_OPTIONS}")
set(CMAKE_CXX_FLAGS_INIT           "${CMAKE_CXX_FLAGS_INIT} ${_CPU_COMPILATION_OPTIONS}")
set(CMAKE_MODULE_LINKER_FLAGS_INIT "${CMAKE_MODULE_LINKER_FLAGS_INIT} ${_CPU_OPTIONS}")
set(CMAKE_EXE_LINKER_FLAGS_INIT    "${CMAKE_EXE_LINKER_FLAGS_INIT} ${_CPU_OPTIONS} -T\"${_CPU_LINKER_SCRIPT}\"")
