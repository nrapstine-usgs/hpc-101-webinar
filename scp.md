### Section 12: scp command 

#### secure copy files from remote to local and local to remote

First, we'll copy a file from our local computer to Yeti. 

Open a new tab and `cd` into your home directory. Then create a file:

```
$ cd 
$ touch test.txt
$ ls
```

To copy a file **from our local computer to Yeti**, we use `scp` (secure copy) command:

```
# on local machine scp <source-local> <dest-Yeti>
$ scp test.txt nrapstine@yeti.cr.usgs.gov:~/
```

Go to Yeti and you should see `test.txt` file is in your home directory on Yeti.

We can also copy a directory with `-r` flag. Go back to the tab on your local machine. Let's create a directory and mv `test.txt` file there. Then we'll copy the entire directory from local machine to your home directory on Yeti.

```
$ mkdir data
$ mv test.txt data/

# copy directory from local to Yeti
$ scp -r data/ nrapstine@yeti.cr.usgs.gov:~/
```

Go to Yeti and you should see `data` directory with `test.txt` file in it in your home directory on Yeti.



To copy a file **from Yeti to local computer**, make the source - Yeti and destination - local directory on your computer. On Yeti, in your home directory, rename `test.txt` to `test_yeti.txt`. 

```
$ mv test.txt test_yeti.txt
```

To copy it back to the local machine, go to the tab with your home directory on your local machine and use `scp` command:

```
# on local machine scp <source-Yeti> <dest-local>
$ scp nrapstine@yeti.cr.usgs.gov:~/test_yeti.txt .
```

The `.` at the end means copy files to the current directory. You should now see `test_yeti.txt` file in your home directory on your local machine.

You can also copy the file but name it something new:

```
# copy and name it something new
$ scp nrapstine@yeti.cr.usgs.gov:~/test_yeti.txt mydata_from_yeti.txt
```

Again, to copy a directory with `-r` flag, type:

```
# copy directory from Yeti to local
$ scp -r nrapstine@yeti.cr.usgs.gov:~/data/ data_from_Yeti/
```

------

Go to Section 13: [Loading modules on Yeti](modules.md)