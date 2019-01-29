FROM debian:stretch-slim

MAINTAINER Vincent Dudek
LABEL Description="Image for building arm-none-eabi toolchain based projects"


RUN apt-get update && \
	apt-get upgrade -y && \
    apt-get install -y \
    	build-essential \
      	git \
      	cmake \
      	bzip2 \
      	python-pip \
      	curl


RUN pip install nrfutil

COPY install_tools.sh /
RUN /install_tools.sh

WORKDIR /home/dev

# Get arm-none-eabi-gcc version 4.9.3
#RUN curl -L https://launchpad.net/gcc-arm-embedded/4.9/4.9-2015-q3-update/+download/gcc-arm-none-eabi-4_9-2015q3-20150921-linux.tar.bz2 -o /tmp/gcc-arm-none-eabi-4_9-2015q3-20150921-linux.tar.bz2 
#RUN	tar -xvjf /tmp/gcc-arm-none-eabi-4_9-2015q3-20150921-linux.tar.bz2 -C /tmp/

#RUN rm -rf /tmp/gcc-arm-none-eabi-4_9-2015q3/share/doc && cp -r /tmp/gcc-arm-none-eabi-4_9-2015q3/* /usr/

#RUN curl -X POST -F 'fileid=8F19D314130548209E75EFFADD9348DB' https://www.nordicsemi.com/api/sitecore/Products/DownloadPlatform -o /tmp/nRF-Command-Line-Tools_9_8_1_Linux-x86_64.tar
#RUN tar -xvf /tmp/nRF-Command-Line-Tools_9_8_1_Linux-x86_64.tar -C /tmp/