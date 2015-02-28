FROM quay.io/assemblyline/buildpack_deps:14.04.2
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
RUN echo deb https://get.docker.com/ubuntu docker main > /etc/apt/sources.list.d/docker.list
RUN apt-get update
RUN apt-get install -yq build-essential debootstrap software-properties-common lxc-docker
RUN curl https://raw.githubusercontent.com/docker/docker/master/contrib/mkimage.sh > /usr/local/sbin/mkimage.sh
RUN chmod 755 /usr/local/sbin/mkimage.sh
RUN mkdir /usr/local/sbin/mkimage
RUN curl https://raw.githubusercontent.com/docker/docker/master/contrib/mkimage/debootstrap > /usr/local/sbin/mkimage/debootstrap
RUN chmod 755 /usr/local/sbin/mkimage/debootstrap
CMD mkimage.sh -t quay.io/assemblyline/ubuntu:14.04.2 debootstrap --variant=minbase --include=inetutils-ping,iproute2 --components=main,universe trusty
