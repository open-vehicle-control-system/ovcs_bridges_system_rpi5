################################################################################
#
# hailort-drivers
#
################################################################################

HAILORT_DRIVERS_VERSION = 4.24.0
HAILORT_DRIVERS_SITE = $(call github,hailo-ai,hailort-drivers,v$(HAILORT_DRIVERS_VERSION))
HAILORT_DRIVERS_LICENSE = GPL-2.0
HAILORT_DRIVERS_LICENSE_FILES = LICENSE
HAILORT_DRIVERS_MODULE_SUBDIRS = linux/pcie

HAILORT_DRIVERS_FIRMWARE = hailo8_fw.$(HAILORT_DRIVERS_VERSION).bin
HAILORT_DRIVERS_EXTRA_DOWNLOADS = \
	https://hailo-hailort.s3.eu-west-2.amazonaws.com/Hailo8/$(HAILORT_DRIVERS_VERSION)/FW/$(HAILORT_DRIVERS_FIRMWARE)

define HAILORT_DRIVERS_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0644 $(HAILORT_DRIVERS_DL_DIR)/$(HAILORT_DRIVERS_FIRMWARE) \
		$(TARGET_DIR)/lib/firmware/hailo/hailo8_fw.bin
endef

$(eval $(kernel-module))
$(eval $(generic-package))
