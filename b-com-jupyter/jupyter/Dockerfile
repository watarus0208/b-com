FROM nvidia/cuda:11.6.2-cudnn8-devel-ubuntu20.04

USER root

RUN apt update && apt -y upgrade
RUN apt install -y curl python3 python3-distutils libsndfile1 vim 
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3 get-pip.py

RUN pip install --upgrade pip
COPY ./ml-jupyter/requirements.txt /tmp/
RUN pip install -r /tmp/requirements.txt 

WORKDIR /workspace
