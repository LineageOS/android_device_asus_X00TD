# Audio
PRODUCT_PROPERTY_OVERRIDES += \
	af.fast_track_multiplier=1 \
	audio.deep_buffer.media=true \
	audio.offload.min.duration.secs=30 \
	audio.offload.video=true \
	persist.vendor.audio.fluence.speaker=false \
	persist.vendor.audio.fluence.voicecall=true \
	persist.vendor.audio.fluence.voicerec=true \
	persist.vendor.audio.hifi.int_codec=true \
	persist.vendor.audio.ras.enabled=false \
	ro.vendor.audio.sdk.fluencetype=fluence  \
	ro.vendor.audio.sdk.ssr=false \
	vendor.audio.dolby.ds2.enabled=false \
	vendor.audio.dolby.ds2.hardbypass=false \
	vendor.audio.flac.sw.decoder.24bit=true \
	vendor.audio.hw.aac.encoder=true \
	vendor.audio.noisy.broadcast.delay=600 \
	vendor.audio.offload.buffer.size.kb=64 \
	vendor.audio.offload.gapless.enabled=true \
	vendor.audio.offload.multiaac.enable=true \
	vendor.audio.offload.multiple.enabled=false \
	vendor.audio.offload.passthrough=false \
	vendor.audio.offload.pstimeout.secs=3 \
	vendor.audio.offload.track.enable=true \
	vendor.audio.parser.ip.buffer.size=262144 \
	vendor.audio.safx.pbe.enabled=true \
	vendor.audio.tunnel.encode=false \
	vendor.audio.use.sw.alac.decoder=true \
	vendor.audio.use.sw.ape.decoder=true \
	vendor.audio_hal.period_size=192 \
	vendor.voice.path.for.pcm.voip=false

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
	bt.max.hfpclient.connections=1 \
	persist.bt.a2dp.aac_disable=true \
	persist.bt.enable.multicast=1 \
	persist.bt.max.a2dp.connections=2 \
	persist.bt.max.hs.connections=2 \
	persist.vendor.bt.a2dp_offload_cap=sbc-aptx-aptxhd-aac \
	qcom.bluetooth.soc=cherokee \
	ro.bluetooth.emb_wp_mode=true \
	ro.bluetooth.wipower=true

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
	persist.camera.expose.aux=1 \
	persist.camera.HAL3.enabled=1 \
	persist.camera.preview.ubwc=0 \
	persist.ts.rtmakeup=1 \
	vendor.camera.aux.packagelist=org.codeaurora.snapcam

# Charging maximum voltage
PRODUCT_PROPERTY_OVERRIDES += \
	persist.chg.max_volt_mv=9000

# CNE
PRODUCT_PROPERTY_OVERRIDES += \
	persist.cne.feature=1

# Dalvik overrides
PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.heapgrowthlimit=256m \
	dalvik.vm.heapstartsize=8m \
	dalvik.vm.heapsize=512m \
	dalvik.vm.heaptargetutilization=0.75 \
	dalvik.vm.heapminfree=512k \
	dalvik.vm.heapmaxfree=8m

# DRM
PRODUCT_PROPERTY_OVERRIDES += \
	drm.service.enabled=true

# Enable stm-events
PRODUCT_PROPERTY_OVERRIDES += \
	persist.debug.coresight.config=stm-events

# FM
PRODUCT_PROPERTY_OVERRIDES += \
	vendor.fm.a2dp.conc.disabled=false

# FRP
PRODUCT_PROPERTY_OVERRIDES += \
	ro.frp.pst=/dev/block/bootdevice/by-name/frp

# FUSE
PRODUCT_PROPERTY_OVERRIDES += \
	persist.fuse_sdcard=true

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
	debug.gralloc.enable_fb_ubwc=1 \
	debug.hwui.use_buffer_age=false \
	debug.sf.enable_hwc_vds=1 \
	debug.sf.hw=1 \
	debug.sf.latch_unsignaled=1 \
	dev.pm.dyn_samplingrate=1 \
	persist.demo.hdmirotationlock=false \
	ro.opengles.version=196610 \
	ro.sf.lcd_density=480 \
	vendor.display.enable_default_color_mode=1

# LED
PRODUCT_PROPERTY_OVERRIDES += \
	persist.asus.led.on=1

# Media
PRODUCT_PROPERTY_OVERRIDES += \
	media.aac_51_output_enabled=true \
	media.stagefright.enable-aac=true \
	media.stagefright.enable-http=true \
	media.stagefright.enable-player=true \
	media.stagefright.enable-qcp=true \
	media.stagefright.enable-scan=true \
	mm.enable.qcom_parser=13631487 \
	mm.enable.smoothstreaming=true \
	mmp.enable.3g2=true \
	persist.mm.enable.prefetch=true \
	vendor.vidc.dec.enable.downscalar=1 \
	vendor.vidc.enc.disable.pq=false \
	vendor.vidc.enc.disable_bframes=1 \
	vidc.enc.dcvs.extra-buff-count=2 \
	vidc.enc.target_support_bframe=1

# Misc
PRODUCT_PROPERTY_OVERRIDES += \
	keyguard.no_require_sim=true \
	persist.vendor.qcomsysd.enabled=1 \
	ro.additionalbutton.operation=0 \
	ro.am.reschedule_service=true \
	ro.control_privapp_permissions=log \
	ro.opa.eligible_device=true \
	ro.sys.fw.use_trim_settings=true

# Netflix
PRODUCT_PROPERTY_OVERRIDES += \
	ro.netflix.bsp_rev=Q660-13149-1

# NFC
PRODUCT_PROPERTY_OVERRIDES += \
	ro.nfc.port=I2C \
	persist.nfc.smartcard.config=SIM1

# NTP Server
PRODUCT_PROPERTY_OVERRIDES += \
	persist.backup.ntpServer="0.pool.ntp.org"

# QCOM cabl
PRODUCT_PROPERTY_OVERRIDES += \
	ro.qualcomm.cabl=2

# QTI
PRODUCT_PROPERTY_OVERRIDES += \
	ro.vendor.at_library=libqti-at.so \
	ro.vendor.extension_library=libqti-perfd-client.so \
	ro.vendor.qti.core_ctl_max_cpu=4 \
	ro.vendor.qti.core_ctl_min_cpu=2 \
	ro.vendor.qti.sys.fw.bg_apps_limit=60

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
	DEVICE_PROVISIONED=1 \
	persist.data.iwlan.enable=true \
	persist.radio.atfwd.start=true \
	persist.radio.multisim.config=dsds \
	persist.radio.plmn_disable_data=true \
	persist.radio.schd.cache=3500 \
	persist.radio.VT_CAM_INTERFACE=1 \
	persist.radio.VT_CAM_INTERFACE=2 \
	persist.vendor.qti.telephony.vt_cam_interface=1 \
	persist.vendor.radio.apm_sim_not_pwdn=1 \
	persist.vendor.radio.custom_ecc=1 \
	persist.vendor.radio.rat_on=combine \
	persist.vendor.radio.sib16_support=1 \
	ril.subscription.types=NV,RUIM \
	rild.libpath=/vendor/lib64/libril-qc-qmi-1.so \
	ro.carrier=unknown \
	ro.com.android.dataroaming=false \
	ro.config.vc_call_vol_steps=11 \
	ro.telephony.default_network=20,20 \
	telephony.lteOnCdmaDevice=1

# RmNet Data
PRODUCT_PROPERTY_OVERRIDES += \
	persist.data.df.agg.dl_pkt=10 \
	persist.data.df.agg.dl_size=4096 \
	persist.data.df.dev_name=rmnet_usb0 \
	persist.data.df.dl_mode=5 \
	persist.data.df.iwlan_mux=9 \
	persist.data.df.mux_count=8 \
	persist.data.df.ul_mode=5 \
	persist.data.wda.enable=true \
	persist.rmnet.data.enable=true

# Sensor
PRODUCT_PROPERTY_OVERRIDES += \
	ro.vendor.sdk.sensors.gestures=false \
	ro.vendor.sensors.cmc=false \
	ro.vendor.sensors.dev_ori=true \
	ro.vendor.sensors.facing=false \
	ro.vendor.sensors.mot_detect=true \
	ro.vendor.sensors.pmd=true \
	ro.vendor.sensors.sta_detect=true

# Skip Validate Disable
PRODUCT_PROPERTY_OVERRIDES += \
	sdm.debug.disable_skip_validate=1

# Shutdown
PRODUCT_PROPERTY_OVERRIDES += \
	ro.build.shutdown_timeout=0 \
	sys.vendor.shutdown.waittime=500

# System prop for UBWC
PRODUCT_PROPERTY_OVERRIDES += \
	video.disable.ubwc=1

# Time
PRODUCT_PROPERTY_OVERRIDES += \
	persist.timed.enable=true

# USB
PRODUCT_PROPERTY_OVERRIDES += \
	ro.usb.firstboot.config=diag,serial_cdev,rmnet,adb

# WFD display
PRODUCT_PROPERTY_OVERRIDES += \
	persist.debug.wfd.enable=1 \
	persist.hwc.enable_vds=1 \
	persist.sys.wfd.virtual=0

# ZRAM
PRODUCT_PROPERTY_OVERRIDES += \
	ro.vendor.qti.config.zram=true
