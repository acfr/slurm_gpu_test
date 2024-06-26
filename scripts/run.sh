#!/bin/bash
# Job name:
#SBATCH --job-name=my_test
#
# Partition - This is the queue it goes in:
#SBATCH --partition=hades
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
## change the cotnainer name to your containers name
#SBATCH --container-image=centos
#
## change the cotnainer mounts to point to the places you would like to access data to/from.
#SBATCH --container-mounts=~/slurm_gput_test/data/data_in:/data/data_in.~/slurm_gput_test/data/data_out:/data/data_out
#
## Command(s) to run inside your container(example):
CURRENT_UID=$(id -u):$(id -g) 
