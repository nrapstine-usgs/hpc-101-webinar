### Section 14: Interactive Jobs

You can also run jobs in an interactive mode by making an allocation request for resources with `salloc` command and then running a program with `srun` command.

In order to run `helloworld.py` program, we have to load two required modules: 

```
$ module load mpi/mpich-x86_64 python/anaconda
$ module list			# to see the loaded modules
```

To request an allocation, we need to specify 3 required flags: **partition** name (**-p**), **account** code (**-A**), and **walltime** (**-t**).  Your account code can be found when you first log in to Yeti.  We are going to request the normal distributed memory partition for 10 minutes, using 2 Nodes (-N 2) with 4 tasks (-n 4).  Enter the command:

```
$ salloc -p normal -A <your_account> -N 2 -n 4 -t 00:10:00  # allocates the resource

salloc: Pending job allocation 1846439
salloc: job 1846439 queued and waiting for resources
salloc: job 1846439 has been allocated resources
salloc: Granted job allocation 1846439
salloc: Waiting for resource configuration
salloc: Nodes n3-[121-122] are ready for job
******************************************

   Yeti Cluster Info
             Account       User 
-------------------- ---------- 
                csas  nrapstine 
            training  nrapstine 
 _________________________________________ 
< Those are your available account codes. >
 ----------------------------------------- 
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

******************************************


[nrapstine@yeti-login20 hpc101] 
```

Now that you have your interactive job allocation (you will see another login screen), you can run the `helloworld.py` code from the shell with `srun  `command:

```
$ srun --mpi=pmi2 python helloworld.py
```

If you do not provide the -n option, srun will execute with the maximum number of cpus allocated to your job.

 You should see output similar to the following:

```
[nrapstine@yeti-login20 hpc101] srun --mpi=pmi2 python helloworld.py 
Hello World!  I'm process 3 of 4 on n3-122.
Hello World!  I'm process 0 of 4 on n3-121.
Hello World!  I'm process 1 of 4 on n3-121.
Hello World!  I'm process 2 of 4 on n3-121.
```

Now to end your job and quit your interactive shell, use the exit command.

 Enter the command:  
 `exit`

 You should see output similar to the following:

```
[nrapstine@yeti-login20 hpc101] exit
exit
salloc: Relinquishing job allocation 1846439
```

Now that your job allocation has been cancelled, you will need to clean up the environment modules you loaded previously. 

Enter the command:  
`module list`

```
$ module list
Currently Loaded Modulefiles:
1) mpi/mpich-x86_64 	2) python/anaconda
```

Note, cancelling your job did not remove the modules.

To remove the modules, use the **module purge** command. 

Enter the command:  
`module purge`

Enter the command:  
`module list`

```
$ module purge
$ module list
No Modulefiles Currently Loaded.
```

------

Go to Section 15: [setting up SSH keys](ssh_keys.md)