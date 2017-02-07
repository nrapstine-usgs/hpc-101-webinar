### Section 11: Editing files with vi

#### vi is a text editor that we will use to edit files on Yeti

You should already be in the examples directory. If not navigate there with `cd ~/hpc-101-webinar/examples` command.

```
$ ls
```

You should see **distributedmemory_normal.slurm**, **helloworld.py**, **narcoleptic_helloworld.py**, and **sharedmemory_UV.slurm** files. Let's first copy helloworld.py to a new file that we can play with:

```
$ cp helloworld.py vi_test.py
```

To start **vi editor**, type 

```
$ vi vi_test.py					# opens a file in vi editor
```

You should see the following:

```python
from mpi4py import MPI
import sys

message = "Hello World!  I'm process %d of %d on %s.\n"

myrank = MPI.COMM_WORLD.Get_rank()
numberproc = MPI.COMM_WORLD.Get_size()
procname = MPI.Get_processor_name()
sys.stdout.write(message % (myrank,numberproc,procname))
~                                                                                                                                                    
~   
```

Lines that start with `~` mark unused lines.  

To quit vi, type:

```
:q
```

If you want to open a file at a certain line number, type:

```
$ vi +4 vi_test.py 			# opens a file at line 4
```

You should see the curser now on line 4 instead of the first line.

When you open a file, vi is in **Command** mode by default. In command mode, you can navigate with arrows or by using `h` to move left, `j` to move down and `k` to move up, and `l` to move right through the file. You cannot actually type in Command mode.

To be able to type, switch from Command mode to **Insert** mode, press `i`. Once you press `i`, at the bottom of your terminal window, you should see:

```
~                                                                                                                                                    
~                                                                                                                                                    
-- INSERT -- 
```

To switch back to Command mode, press `esc`. 



In **Command** mode:

`w` - To move the curser to the start of the next word, exclusing its first character

`e` -  To move the curser to the end of the current word, including the last character

`$` - To jump to the end of the line

`0` or `^` - To jump to beginning of the line

`d` `w` - To delete the letters of the current word until the end excluding space

`u` - To undo an action

`d` `e` - To delete the letters of the current word until the end including the space

`d` `$` - To delete the letters until the end of the line

`dd` - To delete the current line in a file 

`3` `dd` - To delete 3 lines (the current line where your cursor is on and 2 lines below)

`.` - To repeat the command

`yy` - To copy the current line

`3` `yy`- To copy 3 lines

`p` - To paste copied line below the current line

`/search` - To search the file top to bottom. Then, press `n` to show next match top to bottom or `Shift` + `n` to search in reverse bottom to top.

`?search` - To search bottom to top. Press `n` to show the next match (bottom to top). Press `Shift` + `n` to search top to bottom.

`o` - To insert new line below the current line

`O` -  To insert new line above the current line

`r` - To replace a character under the curser

`x` - delete a character

`8` `Shift` + `g` - To jump to a line number 40 (or `:8`)

`G` - To jump to the last line in the file

`:history` - To display command history

`:%s/abc/xyz/g` - replace abc with xyz in entire file

`:w` - To save a file (`:w!` to save forcefully)

`:wq` - To save and quit (`:wq!` to save and quit forcefully)

------

Go to Section 12: [using scp command to copy local files to Yeti](scp.md)