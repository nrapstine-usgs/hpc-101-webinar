### Section 6: Login to USGS supercomputer Yeti with SSH

- Windows users first will have to install [Xming](https://gitlab.cr.usgs.gov/hpc-arc/yeti-user-docs/wikis/wiki/Xming) and [PuTTY](https://gitlab.cr.usgs.gov/hpc-arc/yeti-user-docs/wikis/wiki/Putty). After setting up configurations, Click `Open` and PuTTY will open up a window. Type your user name to login to Yeti. Your password is your AD password. 
- Mac users open Terminal and type:

```
$ ssh yeti.cr.usgs.gov
```

Use your AD credentials. Your user name is whatever your email is but without '@usgs.gov'. Your password is AD password. 

**SSH** is a Secure Shell protocol that allows users access to a remote machine (Yeti cluster) in a secure manner (encrypted transmission of data, user names and passwords over the network).

To copy a file **from our local computer to Yeti**, we use `scp` (secure copy) command:

```
# on local machine scp <source-local> <dest-Yeti>
$ scp mydata.txt nrapstine@yeti.cr.usgs.gov:~/
```

We can also copy a directory with `-r` flag:

```
# copy directory from local to Yeti
$ scp -r data/ nrapstine@yeti.cr.usgs.gov:~/
```

To copy a file **from Yeti to local computer**, make the source - Yeti and destination - local directory on your computer: 

```
# on local machine scp <source-Yeti> <dest-local>
$ scp nrapstine@yeti.cr.usgs.gov:~/mydata.txt .
```

You can also copy the file but name it something new:

```
# copy and name it something new
$ scp nrapstine@yeti.cr.usgs.gov:~/mydata.txt mydata_from_yeti.txt
```

Again, to copy a directory with `-r` flag, type:

```
# copy directory from Yeti to local
$ scp -r nrapstine@yeti.cr.usgs.gov:~/data/ data_from_Yeti/
```

------

Go to Section 7: [Job scheduler SLURM](SLURM.md)
