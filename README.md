## SLURM Template

### Motivation
This template gives you an idea of what a containerised application stucture should be like to make running experiments as smooth as possible with the ACFR HPC using SLURM.

### Getting things ready for the HPC
Once you have your containerised application setup. You need to build your container image in your local computer, you can do this by simply executing your build.sh file inside of the scripts folder.

Then we need to convert the docker image into a .sqsh file. To do this, you require a program called `enroot`. Please follow the step below to install it in your local computer.

#### Install
```bash
# install enroot (required to build custom containers for slurm)
arch=$(dpkg --print-architecture)
curl -fSsL -O https://github.com/NVIDIA/enroot/releases/download/v3.5.0/enroot_3.5.0-1_${arch}.deb
sudo apt install -y ./enroot_3.5.0-1_${arch}.deb
```

Once installed, we can go ahead and execute the following command to conver the docker image into a .sqsh file type.

`enroot import dockerd://your_image_name`

Once the .sqsh file is ready, we need to copy this to our SLURM control node (diana.acfr.usyd.edu.au) via scp. 

To do this, you must execute the following command 

`scp my-image.sqsh <acfr_username>@diana.acfr.usyd.edu.au:/home/user@acfr.usyd.edu.au`

Once you have successfully transfered the built container image to diana, we can run the experiment in the HPC. 

First let's login to the control node (diana) via, make sure you are connected to the ACFR or usyd wifi. If you are connecting remotely please use the VPN. 

`ssh <acfr_username>@diana.acfr.usyd.edu.au`

Once you have logged into diana, you need a shell script for your HPC job. An example of this script is in run.sh in the scripts folder. Make a run.sh similar to this with parameters that suits your experiment. Pay special attention to GPU params, container-iamge and container-mounts parameters. Once you have these finalised, you can put your commands at the end of the file relating to your experiment that needs to run inside of the container.  

To run the experiment, first make the script an executable using the following command 

`chmod +x run.sh`
 
Then run it using 

`run.sh`

A log file will be created in the directory where run.sh is located wich will be named like this 

`serial_test_jobnumber.log`


#### Other useful commands to know
```bash
# run an interactive container on slurm using srun
srun --nodes=1 --container-image=./my-image.sqsh --pty /bin/bash

# convert a local docker image to .sqsh
enroot import dockerd://my-image

# convert a remote docker image to .sqsh
enroot import docker://ros:rolling

# send the processed image to the compute cluster
scp my-image.sqsh user@diana.acfr.usyd.edu.au:/home/user@acfr.usyd.edu.au
```
