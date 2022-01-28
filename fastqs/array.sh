#!/bin/bash
#SBATCH --account=singhlab
#SBATCH --partition=short    		### Partition (like a queue in PBS)
#SBATCH --job-name=fastq.SRA		### Job Name
#SBATCH --output=fastq.out     		### File in which to store job output
#SBATCH --error=fastq.err     		### File in which to store job error messages
#SBATCH --time=00:10:00	 			### Wall clock time limit in Days-HH:MM:SS
#SBATCH --nodes=1       			### Number of nodes needed for the job
#SBATCH --ntasks=1                    ### Number of tasks per array job
#SBATCH --array=0-1           ### Array index
#SBATCH --cpus-per-task=1
 
echo "I am Slurm job ${SLURM_JOB_ID}, array job ${SLURM_ARRAY_JOB_ID}, and array task ${SLURM_ARRAY_TASK_ID}."

links=( ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR908/ERR908503/ERR908503_1.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR908/ERR908503/ERR908503_2.fastq.gz )

curl -O ${links[${SLURM_ARRAY_TASK_ID}]}
