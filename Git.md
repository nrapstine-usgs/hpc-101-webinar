### Section 8: Git  

Git is distributed verstion control system. What does *that* mean?

Distributed means that everyone has a local copy of the central repository. Your local repo has all the information that the central remote repository has. If something happens to the remote repository, every developer has a back-up of the repository.

Make sure that Git is installed, check Git version:

```
$ git --version

# Output
[Out: ] git version 2.10.2
```

Set up configuration with your name and email: 

```
$ git config --list

# Add user name and email if not setup yet
$ git config --global user.name "Natalya Rapstine"
$ git config --global user.email "nrapstine@usgs.gov"
$ git config --list
```

These commands will add your name to all your changes. When you are working on a project with others, they will be able to see who is making changes to the files.

Two scenarios: initialize a repositoty from existing code or clone a remote repository.

Let's **clone a remote repository** to your home directory on Yeti.

Open a Browser and go to: [HPC 101 webinar GitHub repository](https://github.com/nrapstine-usgs/hpc-101-webinar) 

Click on the `Clone or download` icon, and switch to HTTPS copy by clicking `Use HTTPS` then press copy button.

![](./img/clone.png)  

On Yeti, navigate to your home directory (type `cd`) and clone the Yeti Tutorial repository by typing `git clone` and paste the url that you just copied:

```
$ git clone https://github.com/nrapstine-usgs/hpc-101-webinar.git
```

To view information about the remote reposity, enter:

```
$ git remote -v
```

To initialize a repository:

```
$ git init
$ ls -la
$ git status
```

To stop tracking a project with Git, `rm -rf .git` directory.

Next after you make changes to the file, we need to **stage** and **commit** the changes (2-step process).

```
# To stage the changes you made to a file:
$ git add <file>

# or run "git add -A" to add all files to the staging area

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

To push your local changes (after you modify a script or a file) to a remote repository, first you want to **pull** the changes that others have made to the remote repository while you were working on your changes. 

```
$ git pull origin master
# origin is the name of the remote repository
# master is the branch name

$ git push origin master
```

------

Go to Session 9: [Linux/Command Line Essentials](Linux.md)