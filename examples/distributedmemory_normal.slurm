#!/bin/bash
#SBATCH --job-name=enter_a_job_name				  # name your job
#SBATCH -n 4							  # specify number of tasks
#SBATCH -N 2                            			  # number of nodes
#SBATCH -p normal						  # choose your partition
#SBATCH --account=your_account					  # your account code, seen when you first log in
#SBATCH --time=00:10:00						  # time D-HH:MM:SS 
#SBATCH --mail-type=ALL						  # choose when you want to be emailed
#SBATCH --mail-user=youremail@usgs.gov				  # add your email address
#SBATCH -o output-file-name--%j.out                       	  # name of output file 


module load python/anaconda mpi/mpich-x86_64	 		  # load required modules
srun --mpi=pmi2 python narcoleptic_helloworld.py 		  # run your code
