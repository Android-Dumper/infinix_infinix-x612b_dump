#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:33554432:75965a2ba7333412702956d496a6697fd6252884; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:33554432:a7e5913a39b83a809041b9c75525bf51db831186 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:33554432:75965a2ba7333412702956d496a6697fd6252884 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
