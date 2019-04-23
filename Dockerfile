FROM ubuntu:18.04
LABEL maintainer="Matthias Findeisen <findeisen.matthias@gmail.com>"


# Install software
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    python-dev \
    python3-dev \
    python3-pip \
    git \
    libpq-dev \
    liblapack-dev \
    libblas-dev \
    libgeos-dev \
    python3-setuptools \
    build-essential \
    libxml2-dev \
    libxslt1-dev \
    libbz2-dev \
    software-properties-common \
    gfortran \
    gcc-4.7 \
    libblas3 \
    libblas-dev \
    libatlas-base-dev \
    nginx && \
rm -rf /var/lib/apt/lists/*

# For pip install uWSGI 
RUN ln -s /usr/include/locale.h /usr/include/xlocale.h
RUN rm /usr/bin/gcc
RUN ln -s /usr/bin/gcc-4.7 /usr/bin/gcc

# Copy requirements.txt
COPY /open-context-py/requirements.txt /app/

# Install pip requirements
RUN pip3 install -r /app/requirements.txt

# WORKDIR /app
COPY /open-context-py /app

# create log dir for opencontext
RUN mkdir /app/logs/
RUN touch /app/logs/error.log
