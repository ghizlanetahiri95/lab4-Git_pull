#!/bin/bash
#
#SBATCH -p hpc-bio-pacioli
#SBATCH --chdir=/home/alumno24/lab4-Git
#SBATCH -J lab4_24
#SBATCH --output=slurm-%j.out
#SBATCH --error=%u-%j.err
#SBATCH --mail-type=NONE #END/START/NONE
#SBATCH --mail-user=MAIL@um.es
#SBATCH --cpus-per-task=4
#SBATCH --ntasks-per-node=4  # a maximum count of tasks per node
#SBATCH --time=00:30:00


# @author: fjredondo
# @description: 3.2.1 Modificación de ficheros y actualización de repositorios

# execution Operations
var=$(date +'%Y/%m/%d %r')
echo "Job start at $var"


echo "a) SBATCH --cpus-per-task=4"
echo "b) Start executing ./file-cut.sh with srun -n 4"

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
echo OMP_NUM_THREADS: $OMP_NUM_THREADS

time srun -n 4 ./file-cut.sh

var=$(date +'%Y/%m/%d %r')
echo "Job has ended at $var"

