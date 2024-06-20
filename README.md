## SLURM Template

#### Useful commands
```bash
# convert a local docker image to .sqsh
enroot import dockerd://my-image

# convert a remote docker image to .sqsh
enroot import docker://ros:rolling

# send the processed image to the compute cluster
scp my-image.sqsh user@diana.acfr.usyd.edu.au:/home/user@acfr.usyd.edu.au

# run an interactive container on slurm
srun --nodes=1 --container-image=./my-image.sqsh --pty /bin/bash
```
