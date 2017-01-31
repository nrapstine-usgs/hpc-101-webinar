### Section 12: scp command 

#### secure copy remote to local and local to remote

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

Go to Section 13: [Loading modules on Yeti](modules.md)