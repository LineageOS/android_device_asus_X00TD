LOG_TAG="SetEmmcInfo"
logi ()
{
	/vendor/bin/log -t $LOG_TAG -p i "$@"
}

logi "set eMMC property -- start"
emmc_status=`cat /sys/bus/mmc/devices/mmc0\:0001/emmc_status`
emmc_health=`cat /sys/bus/mmc/devices/mmc0\:0001/emmc_health`
setprop asus.storage.primary.status $emmc_health

emmc_size=`cat /sys/bus/mmc/devices/mmc0\:0001/emmc_total_size`
setprop asus.storage.primary.size "$emmc_size"G

emmc_preEOL=${emmc_health:0:4}
setprop asus.storage.primary.health $emmc_preEOL

setprop asus.storage.primary.type 'eMMC'

emmc_healthtypeA=`cat /sys/bus/mmc/devices/mmc0\:0001/emmc_health_A`
setprop asus.storage.primary.healthtypeA $emmc_healthtypeA

emmc_healthtypeB=`cat /sys/bus/mmc/devices/mmc0\:0001/emmc_health_B`
setprop asus.storage.primary.healthtypeB $emmc_healthtypeB
logi "set eMMC property -- end"
