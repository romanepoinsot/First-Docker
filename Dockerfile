
FROM ubuntu:18.04

RUN apt-get update && \
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata && \
apt-get install -y software-properties-common apt-utils curl wget

RUN apt-get install gdebi-core -y

RUN apt-get build-dep r-base 

ARG R_VERSION=3.6.3

RUN curl -O https://cran.rstudio.com/src/base/R-3/R-${R_VERSION}.tar.gz && \
tar -xzvf R-${R_VERSION}.tar.gz && \
cd R-${R_VERSION}

RUN apt-get install build-essential fort77 xorg-dev liblzma-dev libblas-dev gfortran -y && \
apt-get install gcc-multilib gobjc++ aptitude -y && \
apt-get install libreadline-dev -y && \
apt-get install libbz2-dev -y && \
apt-get install libpcre3-dev -y && \
apt-get install libcurl4 libcurl4-openssl-dev -y && \
apt-get install default-jre -y && \
apt-get install default-jdk -y && \
apt-get install openjdk-8-jdk openjdk-8-jre -y

RUN ./configure --prefix=/usr/local/bin/R/${R_VERSION} --enable-R-shlib --with-bl --with-readline=no --with-x=no && \
make && \
make install