### Section 5: Login to Yeti with SSH

**SSH** is a Secure Shell protocol that allows users access to a remote machine (Yeti cluster) in a secure manner (encrypted transmission of data, user names and passwords over the network).

To get started, 

- Windows users first will have to install [Xming](https://gitlab.cr.usgs.gov/hpc-arc/yeti-user-docs/wikis/wiki/Xming) and [PuTTY](https://gitlab.cr.usgs.gov/hpc-arc/yeti-user-docs/wikis/wiki/Putty). After setting up configurations, Click `Open` and PuTTY will open up a window. Type your user name to login to Yeti. Your user name is whatever your email is but without '@usgs.gov'. Your password is your AD password. 
- Mac users open a Terminal. To open a Terminal, press `command` + `space`, then type `term` and press `enter`. The Terminal window will pop up. You can customize your Terminal, by clicking on Terminal -> Preferences… (or alternatively, press `command` + `,`) to open up Preferences. There you can choose a profile that you like (make that Default to open up new Terminal window with that profile). 

In the Terminal (Mac) , type:

```
$ ssh yeti.cr.usgs.gov
```

Use your AD credentials. Your user name is whatever your email is but without '@usgs.gov'. Your password is AD password. 

After you login to Yeti, you'll see the login screen that tells you what your account is.

------

Go to Section 6: [Job scheduler SLURM](SLURM.md)
