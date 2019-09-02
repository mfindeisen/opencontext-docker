# FROM ubuntu:18.04
FROM python:3.6-stretch
LABEL maintainer="Matthias Findeisen <findeisen.matthias@gmail.com>"

ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8

# Install software
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    python3-dev \
    python3-pip \
    uwsgi \
    uwsgi-src \
    uwsgi-plugin-python3 \
    uuid-dev \
    libcap-dev \
    libpcre3-dev \
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


# For uWSGI (pip)
#RUN ln -s /usr/include/locale.h /usr/include/xlocale.h
#RUN rm /usr/bin/gcc
#RUN ln -s /usr/bin/gcc-4.7 /usr/bin/gcc

#RUN mkdir /app
WORKDIR /src

# Copy requirements.txt
COPY requirements.txt .

# Install pip requirements
RUN pip3 install -r requirements.txt

# WORKDIR /app
#COPY /open-context-py .

COPY docker-entrypoint.sh .
RUN chmod 777 docker-entrypoint.sh

# create log dir for opencontext
RUN mkdir logs
RUN touch ./logs/error.log

RUN pip3 install gunicorn

RUN PYTHON=python3.6 uwsgi --build-plugin "/usr/src/uwsgi/plugins/python python36"
RUN ln python36_plugin.so /usr/src/uwsgi/plugins/python/python36_plugin.so