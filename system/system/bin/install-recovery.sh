#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:34649388:c0451b7beea1edbc74b8cbfe2d7d32e47bc5385f; then
  applypatch --bonus /system/etc/recovery-resource.dat \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:22345000:bf71c987ab536622aeb308e30ec55ae1aeda9e8c \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:34649388:c0451b7beea1edbc74b8cbfe2d7d32e47bc5385f && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
