ARG PYTORCH="2.1.1"
ARG CUDA="12.1"
ARG CUDNN="8"

# Specify the base image
FROM pytorch/pytorch:${PYTORCH}-cuda${CUDA}-cudnn${CUDNN}-devel

# Install any required packages
# RUN apt-get update \
#     && apt-get install -y git htop nano wget unzip \
#     && apt-get clean \
#     && rm -rf /var/lib/apt/lists/*

# Install any 
RUN pip install torch torchvision poutyne
