### Section 10: Editing files with vi

To start vi editor, type 

```
$ vi <file.txt>					# opens a file in vi editor
```

 If you want to open a file at a certain line number, type:

```
$ vi +50 <file.txt> 			# opens a file at line 50
```

To quit vi, type:

```
:q
```

Vi has two modes: 

- Command mode in which you navigate with arrows or by using `h` to move left, `l` to move right, `j` to move down and `k` to move up through the file. When you open a file, it is in Command mode by default.
- Insert mode in which you edit the text/code. To switch from Command mode to Insert mode, press `i`. To switch back to Command mode, press `esc`. 

In **Command** mode:

`dd` - To delete the current line in a file 

`dd` + `3` - To delete 3 lines (the current line where your cursor is on and 2 lines below)

`u` - To undo an action

`.` - To repeat the command

`yy` - To copy the current line

`yy` + `3` - To copy 3 lines

`p` - To paste copied line below current line

`/search` - To search the file top to bottom. Then, press `n` to show next match top to bottom or `Shift` + `n` to search in reverse bottom to top.

`?search` - To search bottom to top. Press `n` to show the next match (bottom to top). Press `Shift` + `n` to search top to bottom.

`o` - To insert new line below the current line

`O` -  To insert new line above the current line

`r` - To replace a character under the curser

`x` - delete a character

`0` or `^` - To jump to beginning of the line

`$` - To jump to the end of the line

`40` + `Shift` + `g` - To jump to a line number 40 (or `:40`)

`G` - To jump to the last line in the file

`:w` - To save a file (`:w!` to save forcefully)

`:wq` - To save and quit (`:wq!` to save and quit forcefully)

`:history` - To display command history

`:%s/abc/xyz/g` - replace abc with xyz in entire file

------

Go to Section 11: [Job scheduler SLURM](SLURM.md)