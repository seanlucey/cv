# XeTex Docker Image, Ubuntu 18.04 based with dependencies installed.
FROM ubuntu:18.04

# Disable interactive prompts from Ubuntu packages.
ENV DEBIAN_FRONTEND=noninteractive

# Installs TeX, LaTeX, and XeLaTeX dependencies.
RUN apt update && apt install --yes \
  git \
  ca-certificates \
  wget \
  inotify-tools \
  lmodern \
  make \
  texlive-fonts-recommended \
  texlive-generic-recommended \
  texlive-lang-english \
  texlive-xetex && \
  apt-get autoclean && \
  apt-get --purge --yes autoremove && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Export output data
WORKDIR /data
VOLUME ["/data"]
