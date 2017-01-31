### Section 15: Batch Jobs

On Yeti, navigate into `hpc-101-webinar/examples/` directory:

```
$ cd hpc-101-webinar/examples
```

View the content of this directory:

```
$ ls
```

You should see several files: sharedmemory_UV.slurm, distributedmemory_normal.slurm, helloworld.py, and narcoleptic_helloworld.py.

#### Shared memory example

The **slurm** files that you see are **batch** scripts (**text** files that contain information about the job) that are a convenient way to run code. In this exercise you will use the `sbatch` command to submit your job to a **queue** using `sharedmemory_UV.slurm` script. This file has the basic information needed to run on UV partition (Yeti's shared memory partition). Enter the command: `cat sharedmemory_UV.slurm`

The file should look like this:

```
$ cat hpc101/sharedmemory_UV.slurm 
#!/bin/bash
#SBATCH --job-name=enter_a_job_name			# name your job
#SBATCH -n 4								# number of tasks
#SBATCH -p UV								# choose your parition
#SBATCH --account=your_account  	        # enter the account code  
#SBATCH --time=00:10:00						# requested job time D-HH:MM:SS
#SBATCH --mail-type=ALL						# choose when you want to be emailed 
#SBATCH --mail-user=youremail@usgs.gov		# add your email address
#SBATCH -o output-filename-%j.out           # name of output file (the %j inserts the jobid)

module load python/anaconda mpi/mpich-x86_64		# load required modules
srun --mpi=pmi2 python narcoleptic_helloworld.py	# run your code
```

You will see the same required flags (**-p, --account, --time**). To review all available options see: [Slurm Docs](http://slurm.schedmd.com/sbatch.html). 

Below are the options shown in our `hello_world-Rmpi.slurm` file:

> **#SBATCH --job-name=enter_a_job_name**  
> The specified name will appear along with the job id number when querying running jobs on the system. The default is the name of the batch script.

> **#SBATCH -n 4**  
> This option advises the SLURM controller that job steps run within the allocation will launch a maximum of number tasks and to provide for sufficient resources.
>
> **#SBATCH -p UV**  
> Request a specific partition for the resource allocation. If the job can use more than one partition, specify their names in a comma separate list and the one offering earliest initiation will be used.
>
> **#SBATCH --account=your_account**
> This flag "charges" resources used by this job to specified account.  We use this information on Yeti to provide statistics on CPU hours and number of jobs run for different groups and projects.

> **#SBATCH --time=00:10:00**  
> Sets a limit on the total run time of the job allocation. If the requested time limit exceeds the partition's time limit, the job will be left in a PENDING state (possibly indefinitely).  Yeti has time limits on each partition as follows: noraml = 7 days, UV = 3 days, large = 3 days, long = 30 days. Acceptable time formats include "minutes", "minutes:seconds", "hours:minutes:seconds", "days-hours", "days-hours:minutes" and "days-hours:minutes:seconds".
>
> **#SBATCH --mail-type=ALL**  
> Notify user by email when certain event types occur. Valid type values are BEGIN, END, FAIL, REQUEUE, and ALL (any state change). The user to be notified is indicated with --mail-user.
>
> **#SBATCH --mail-user=youremail@usgs.gov**  
> User to receive email notification of state changes as defined by --mail-type. The default value is the submitting user.
>
> **#SBATCH -o output-filename-%j.out**  
> Name of output file. The %j inserts the job ID. 

Open and edit `sharedmemory_UV.slurm` with vi:

```
$ vi sharedmemory_UV.slurm
```

To change the text,  hit the "i" key to enter insert mode.

Using `j` or your down arrow, move to the line:  
**#SBATCH --job-name=enter_a_job_name**  
Enter a new job name (example: my-helloworld-job)

Move down to the line:  
**#SBATCH --account=your_account**  
Enter your account code. You see your account code when you first login to Yeti.

Move down to the line:  
**#SBATCH --mail-user=youremail@usgs.gov**  
Add your email address (you will get an email when your job runs, completes, etc.)

Move down to the line:  
**#SBATCH -o output-filename-%j.out**   
Rename your output file, but keep the %j so that you know which job ID the file is associated with. The %j inserts the job ID (example: -o hello_output-%j.out)

Save your file and exit vi.  
Hit the **esc** key, then type **:wq** and hit **enter** (escape edit mode, : brings the prompt up, w=write to save the file, q=quit to exit vi)

Note, that we also have to load the required modules with `module load` command. 

The script `narcoleptic_helloworld.py` is MPI hello world Python program, so we have to load mpi module.

You can take a look with:

```
$ cat narcoleptic_helloworld.py
```

The program looks like:

```python
from mpi4py import MPI
import sys
import time

message = "Hello World!  I'm process %d of %d on %s.\n"

myrank = MPI.COMM_WORLD.Get_rank()
numberproc = MPI.COMM_WORLD.Get_size()
procname = MPI.Get_processor_name()
sys.stdout.write(message % (myrank,numberproc,procname))
time.sleep(300)
```

Finally, to execute sharedmemory_UV.slurm, on the command line, enter:

```
$ sbatch sharedmemory_UV.slurm
Submitted batch job 209386
```

You will receive an email when your job starts, and another when it finishes.

To check the status of your job, enter:

```
$ squeue -u <username>
```

 To cancel a job, enter:

```
$ scancel <jobid>
```

Or you can cancel all the jobs under your username with one command:

```
$ scancel -u <username>
```

Now, run the `sharedmemory_UV.slurm` until it completes:

```
$ sbatch sharedmemory_UV.slurm
```

Once you get the email that your job is complete, look at the contents of your output file. (Job should take 5 minutes to run).

Enter the command:  

```
$ cat output-filename-%j.out
```

The contents of your file should look similar to the following:

```
$ cat hello-output-209391.out
Hello World!  I'm process 0 of 4 on UV00000437-P001.
Hello World!  I'm process 1 of 4 on UV00000437-P001.
Hello World!  I'm process 2 of 4 on UV00000437-P001.
Hello World!  I'm process 3 of 4 on UV00000437-P001.
```



#### Distributed memory example

Next, we will run a batch script on normal partition (Yeti's distributed memory partition).

Open the `distributedmemory_normal.slurm` file:

```
$ cat distributedmemory_normal.slurm
```

Your output should look like the following:

```
#!/bin/bash
#SBATCH --job-name=enter_a_job_name		# name your job
#SBATCH -n 4							# specify number of tasks
#SBATCH -N 2                            # number of nodes
#SBATCH -p normal						# choose your partition
#SBATCH --account=your_account			# your account code, seen when you first log in
#SBATCH --time=00:10:00					# time D-HH:MM:SS 
#SBATCH --mail-type=ALL					# choose when you want to be emailed
#SBATCH --mail-user=youremail@usgs.gov					  # add your email address
#SBATCH -o output-file-name--%j.out                       # name of output file 


module load python/anaconda mpi/mpich-x86_64	 		  # load required modules
srun --mpi=pmi2 python narcoleptic_helloworld.py 		  # run your code
```

Edit the `distributedmemory_normal.slurm` file and modify the same fields you did for the `sharedmemory_UV.slurm` file:  --job-name, --acount, --mail-user, and -o defaults.

Run the batch script:

```
$ sbatch distributedmemory_normal.slurm
Submitted batch job 1846418

$ squeue -u <username>
            JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
           1846418    normal hello_no nrapstin  R       0:07      2 n3-[121-122]
```

After your job completes (you should receive an email), look at your output file.

Enter the command:  

```
$ cat output-filename-%j.out
```

The contents of your file should look similar to the following:

```
Hello World!  I'm process 0 of 4 on n3-121.
Hello World!  I'm process 3 of 4 on n3-122.
Hello World!  I'm process 2 of 4 on n3-121.
Hello World!  I'm process 1 of 4 on n3-121.
```

Notice that this time you had 4 tasks running on 2 different nodes, as requested in #SBATCH flags **-n 4** (tasks)  and **-N 2** (nodes). 

------

Go to Section 16: [running jobs interactively](interactive.md)

