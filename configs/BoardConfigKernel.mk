# Copyright (C) 2020-2022 Project 404
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Architecture.
TARGET_KERNEL_ARCH := arm64

# Cross Compiler.
TARGET_KERNEL_CROSS_COMPILE_PREFIX := $(shell pwd)/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-
TARGET_KERNEL_CROSS_COMPILE_ARM32_PREFIX := $(shell pwd)/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/bin/arm-linux-androideabi-

# Enable LLVM Support.
KERNEL_LLVM_SUPPORT := true

# Enable SDLLVM Support.
ifneq (,$(filter 3.18 4.4 4.9, $(TARGET_KERNEL_VERSION)))
KERNEL_SD_LLVM_SUPPORT ?= true
endif

# Qualcomm kernel.
ifeq ($(TARGET_PREBUILT_KERNEL),)
TARGET_COMPILE_WITH_MSM_KERNEL := true
endif

# Defining BOARD_PREBUILT_DTBOIMAGE here as AndroidBoardCommon.mk
# is included before build/core/Makefile, where it is required to
# set the dependencies on prebuilt_dtbo.img based on definition of
# BOARD_PREBUILT_DTBOIMAGE
ifneq ($(strip $(BOARD_KERNEL_SEPARATED_DTBO)),)
BOARD_PREBUILT_DTBOIMAGE ?= $(PRODUCT_OUT)/prebuilt_dtbo.img
endif
