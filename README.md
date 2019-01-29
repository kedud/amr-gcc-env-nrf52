This image is meant to be used to make the embedded development for nRF52 as much platform independent as possible.
It can be used for local builds and testing, or CI purposes.

Base image: debian:stretch-slim

Pre-installed software:

 - make
 - cmake
 - arm-none-eabi-gcc toolchain
 - curl
 - git
 - python-pip
 - nrfutil
 - nRF-command-line-tools (mergehex & nrfjprog)