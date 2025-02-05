#!/bin/bash
# Job name:
#SBATCH --job-name=my_test
#
# Partition - This is the queue it goes in:
#SBATCH --partition=hpc
#
# Where to send email (optional). Replace the username with yours.
#SBATCH --mail-user=jjustin@acfr.usyd.edu.au
#
# Number of nodes you need per job:
#SBATCH --nodes=1
#
# Memory needed for the jobs.  Try very hard to make this accurate.  DEFAULT = 4gb
#SBATCH --mem=8gb
#
# Number of tasks (one for each CPU desired for use case) (example):
#SBATCH --ntasks=1
#
# Processors per task:
#SBATCH --cpus-per-task=1
#
# Standard output and error log
#SBATCH --output=serial_test_%j.log
#
#
## change the container name to your containers name
#SBATCH --container-image=centos
#
## change the container mounts to point to the places you would like to access data to/from.
#SBATCH --container-mounts=~/slurm_gpu_test/data/data_in:/data/data_in,~/slurm_gpu_test/data/data_out:/data/data_out,~/slurm_gpu_test/src/:/slurm_gpu_test/src/
#
## Command(s) to run inside your container(example):

python3 ../src/train.py

