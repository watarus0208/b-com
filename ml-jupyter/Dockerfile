FROM nvidia/cuda:11.6.2-cudnn8-devel-ubuntu20.04

USER root

RUN apt-get update && apt-get -y upgrade
RUN apt install -y curl python3 python3-distutils
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3 get-pip.py

RUN pip install --upgrade pip
COPY requirements.txt .
RUN pip install -r requirements.txt 

WORKDIR /workspace
