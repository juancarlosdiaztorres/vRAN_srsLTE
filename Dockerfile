FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -yq dist-upgrade

RUN apt-get install --no-install-recommends -yq \
     cmake \
     libuhd-dev \
     uhd-host \
     libboost-program-options-dev \
     libvolk1-dev \
     libfftw3-dev \
     libmbedtls-dev \
     libsctp-dev \
     libconfig++-dev \
     curl \
     iputils-ping \
     unzip
WORKDIR /root

RUN apt-get --no-install-recommends -qy install build-essential git ca-certificates libzmq3-dev
# Get srsLTE and compile
RUN git clone https://github.com/srsLTE/srsLTE.git && \
    cd srsLTE && \
    git checkout tags/release_19_12
#RUN git clone https://github.com/srsLTE/srsLTE.git && cd srsLTE  && git checkout 4fc243ae4bcec42f12c28f5f843313fad7fd90c2 

RUN mkdir -p /root/srsLTE/build

WORKDIR /root/srsLTE/build
RUN cmake ../
RUN make
RUN make -j `nproc` install
RUN ldconfig

RUN apt-get --no-install-recommends -qy install iproute2 tshark net-tools iperf iperf3

ENV TZ=Europe/Madrid
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
