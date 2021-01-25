FROM python:3.7.9-buster
LABEL maintainer="Matthias Findeisen <findeisen.matthias@gmail.com>"

ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8

ENV VIRTUAL_ENV=/opt/venv/
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"


# Install software
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    #python3-dev \
    python3.7-dev \ 
    python3-distutils \
    uwsgi-src \
    uuid-dev \
    python3-pip \
    #uwsgi \
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

WORKDIR /src

# Copy requirements.txt
COPY /open_context/requirements.txt .

# update pip
RUN /opt/venv/bin/python3 -m pip install --upgrade pip

# Install pip requirements
RUN /opt/venv/bin/python3 -m pip install -r requirements.txt

COPY /open_context/docker-entrypoint.sh .
RUN chmod 777 docker-entrypoint.sh

RUN /opt/venv/bin/python3 -m pip install uwsgi

RUN export PYTHON=python3.7
RUN uwsgi --build-plugin "/usr/src/uwsgi/plugins/python python37"
RUN mv python37_plugin.so /usr/src/uwsgi/plugins/python/
RUN chmod 644 /usr/src/uwsgi/plugins/python/python37_plugin.so
