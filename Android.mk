ifeq ($(WIRELESS_MODULE),ath6kl)
ifneq ($(TARGET_SIMULATOR),true)

LOCAL_PATH:= $(call my-dir)
define include-ar6k-prebuilt
    include $$(CLEAR_VARS)
    LOCAL_MODULE := $(4)
    LOCAL_MODULE_STEM := $(3)
    LOCAL_MODULE_TAGS := debug eng optional
    LOCAL_MODULE_CLASS := ETC
    LOCAL_MODULE_PATH := $(2)
    LOCAL_SRC_FILES := $(1)
    include $$(BUILD_PREBUILT)
endef

define add-ar6k-prebuilt-file
    $(eval $(include-ar6k-prebuilt))
endef
# Olca3.2 compat-wireless

ar6k_compat_wireless_dst_dir := $(TARGET_OUT)/lib/modules
# $(call add-ar6k-prebuilt-file,compat.ko,$(ar6k_compat_wireless_dst_dir),compat.ko,compat)
$(call add-ar6k-prebuilt-file,cfg80211.ko,$(ar6k_compat_wireless_dst_dir),cfg80211.ko,cfg80211)
# $(call add-ar6k-prebuilt-file,mac80211.ko,$(ar6k_compat_wireless_dst_dir),mac80211.ko,mac80211)
# $(call add-ar6k-prebuilt-file,ath.ko,$(ar6k_compat_wireless_dst_dir),ath.ko,ath)
$(call add-ar6k-prebuilt-file,ath6kl_sdio.ko,$(ar6k_compat_wireless_dst_dir),ath6kl_sdio.ko,ath6kl_sdio)
ar6k_compat_wireless_dst_dir :=

# firmware for semco module

ar6k_hw21_dst_dir := $(TARGET_OUT)/etc/firmware/ath6k/AR6003/hw2.1.1
csr_bt_dst_dir := $(TARGET_OUT)/bluetooth

$(call add-ar6k-prebuilt-file,A31_Generic_20110128.bin,$(ar6k_hw21_dst_dir),A31_Generic_20110128.bin,semco_bdata)
$(call add-ar6k-prebuilt-file,A31_Script_20110215.psr,$(csr_bt_dst_dir),A31_Script_20110215.psr,semco_csr_bt_psr)

ar6k_hw21_dst_dir :=
csr_bt_dst_dir :=

endif
endif
