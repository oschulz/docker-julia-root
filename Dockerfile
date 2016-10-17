FROM cern/cc7-base

USER root

RUN yum update -y && yum install -y \
    bzip2 \
    cmake \
    gcc-c++ \
    gcc-gfortran \
    git \
    libcurl \
    libcurl-devel \
    libcurl-openssl \
    libSM \
    libX11 \
    libXext \
    libXft \
    libXpm \
    m4 \
    make \
    nettle \
    openssl \
    openssl-devel \
    openssl-libs \
    patch \
    tar \
    vim


COPY provisioning /root/provisioning
RUN provisioning/provision.sh

#EXPOSE 8888

#CMD /bin/bash
