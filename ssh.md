### Section 6: Login to USGS supercomputer Yeti with SSH

- Windows users first will have to install [Xming](https://gitlab.cr.usgs.gov/hpc-arc/yeti-user-docs/wikis/wiki/Xming) and [PuTTY](https://gitlab.cr.usgs.gov/hpc-arc/yeti-user-docs/wikis/wiki/Putty). After setting up configurations, Click `Open` and PuTTY will open up a window. Type your user name to login to Yeti. Your password is your AD password. 
- Mac users open Terminal and type:

```
$ ssh yeti.cr.usgs.gov
```

Use your AD credentials. Your user name is whatever your email is but without '@usgs.gov'. Your password is AD password. 

**SSH** is a Secure Shell protocol that allows users access to a remote machine (Yeti cluster) in a secure manner (encrypted transmission of data, user names and passwords over the network).

------

Go to Section 7: [Job scheduler SLURM](SLURM.md)
