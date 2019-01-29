#!/bin/sh

# Fetching arme-none-eabi gcc v4.9.3 (compatbilble with nordic SDK14.2 bootloader)
curl -L https://launchpad.net/gcc-arm-embedded/4.9/4.9-2015-q3-update/+download/gcc-arm-none-eabi-4_9-2015q3-20150921-linux.tar.bz2 -o /tmp/gcc-arm-none-eabi-4_9-2015q3-20150921-linux.tar.bz2 
tar -xvjf /tmp/gcc-arm-none-eabi-4_9-2015q3-20150921-linux.tar.bz2 -C /tmp/

# Install toolchain
rm -rf /tmp/gcc-arm-none-eabi-4_9-2015q3/share/doc && cp -r /tmp/gcc-arm-none-eabi-4_9-2015q3/* /usr/
rm -rf /tmp/gcc-arm-none-eabi-4_9-2015q3/

# Fetch Nordic command line tools
curl -X POST -F 'fileid=8F19D314130548209E75EFFADD9348DB' https://www.nordicsemi.com/api/sitecore/Products/DownloadPlatform -o /tmp/nRF-Command-Line-Tools_9_8_1_Linux-x86_64.tar
tar -xvf /tmp/nRF-Command-Line-Tools_9_8_1_Linux-x86_64.tar -C /tmp/

cp /tmp/mergehex/mergehex /usr/bin/mergehex
cp /tmp/nrfjprog/nrfjprog /usr/bin/nrfjprog

rm -rf /tmp/*
