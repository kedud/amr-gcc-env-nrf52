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