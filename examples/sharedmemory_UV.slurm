#!/bin/bash
#SBATCH --job-name=enter_a_job_name			#name your job
#SBATCH -n 4						#number of tasks
#SBATCH -p UV						#choose your parition
#SBATCH --account=your_account		                #enter the account code you see when you first log in 
#SBATCH --time=00:10:00					#requested job time D-HH:MM:SS
#SBATCH --mail-type=ALL					#choose when you want to be emailed BEGIN, END, FAIL, REQUEUE, and ALL
#SBATCH --mail-user=youremail@usgs.gov			#add your email address
#SBATCH -o output-filename-%j.out                  	#name of output file (the %j inserts the jobid)

module load python/anaconda mpi/mpich-x86_64		#load required modules
srun --mpi=pmi2 python narcoleptic_helloworld.py	#run your code

