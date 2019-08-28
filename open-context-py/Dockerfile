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

# For uWSGI (pip)
RUN ln -s /usr/include/locale.h /usr/include/xlocale.h
RUN rm /usr/bin/gcc
RUN ln -s /usr/bin/gcc-4.7 /usr/bin/gcc

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