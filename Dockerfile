# Specify the base image
FROM ultralytics/ultralytics

# Install required apt packages
# RUN apt-get update \
#     && apt-get install -y git htop nano wget unzip \
#     && apt-get clean \
#     && rm -rf /var/lib/apt/lists/*

# Install required python packages
# RUN pip install torch torchvision poutyne
