## SLURM Template
#### Install
```bash
# install enroot (required to build custom containers for slurm)
arch=$(dpkg --print-architecture)
curl -fSsL -O https://github.com/NVIDIA/enroot/releases/download/v3.5.0/enroot_3.5.0-1_${arch}.deb
sudo apt install -y ./enroot_3.5.0-1_${arch}.deb
```

#### Useful commands
```bash
# run an interactive container on slurm
srun --nodes=1 --container-image=./my-image.sqsh --pty /bin/bash

# convert a local docker image to .sqsh
enroot import dockerd://my-image

# convert a remote docker image to .sqsh
enroot import docker://ros:rolling

# send the processed image to the compute cluster
scp my-image.sqsh user@diana.acfr.usyd.edu.au:/home/user@acfr.usyd.edu.au
```
