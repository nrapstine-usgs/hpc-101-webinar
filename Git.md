### Section 9: Git  

Git is distributed verstion control system. What does that mean?

Distributed means that everyone has a local copy of the central repository. Your local repo has all the information that the central remote repository has. If something happens to the remote repository, every developer has a back-up of the repository.

Make sure that git is installed, check git version:

```
$ git --version

# Output
[Out: ] git version 2.7.4 (Apple Git-66)
```

Set up configuration with your name and email: 

```
git config --global user.name "Natalya Rapstine"
git config --gloabl user.email "nrapstine@usgs.gov"

git config --list
```

These commands will add your name to all your changes. When you are working on a project with others, they will be able to see who is making changes to the files.

Getting help:

```
$ git help <action>

# Or
git <verb> --help
```

Two scenarios: initialize a repositoty from existing code or **clone a remote repository.**

```
$ git init
$ ls -la
$ git status
```

To stop tracking a project with Git, `rm -rf .git` directory.

Next after you make changes to the file, we need to **stage** and **commit** the changes (2-step process).

```
$ git add <file>
# or run git add -A # to add all files to the staging area

$ git status
```

To remove files from staging area:

```
$ git reset <file>
# or to remove all staged files:
$ git reset 
$ git status
```

To commit the files in the staging area:

```
$ git commit -m "detailed message describing what changes you've made"

$ git status

$ git log      # to see commit history
```

For this tutorial, we are going to clone a remote repository. Open a Browser and go to `https://gitlab.cr.usgs.gov/hpc-arc/yeti-user-docs`.

Change SSH to HTTPS Button and press on Copy to Clipboard button.

![git-clone](./img/git-clone.png)  

On Yeti, navigate to your home directory and clone the Yeti Tutorial repository by typing `git clone` and paste the url that you just copied:

```
$ git clone https://gitlab.cr.usgs.gov/hpc-arc/yeti-user-docs.git
```

When you enter `ls` command, you should see `yeti-user-docs` directory in your home. 

To view information about the remote reposity, enter:

```
$ git remote -v
```

To push your local changes to remote repository, first you want to `pull` the changes that others have made to the remote repository while you were working on your changes. 

```
$ git pull origin master
# origin is the name of the remote repository
# master is the branch name

$ git push origin master
```

------

Go to Session 10: [vi editor](./vi)