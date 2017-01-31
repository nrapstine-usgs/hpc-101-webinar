### Section 16: SSH Keys

**SSH keys** are a way to identify trusted computers, without involving passwords.  
The steps below will walk you through generating an SSH key.

1. Login to Yeti (Windows users open PuTTY and connect to Yeti instead of typing the ssh command below)  
    Enter the command:  
    `ssh yeti.cr.usgs.gov`

2. Verify you don't already have an SSH key  
    Enter the command:  
    `ls -la ~/.ssh`

    By default, the filenames of the public keys are one of the following:

    \> id_dsa.pub  
    \> id_ecdsa.pub  
    \> id_ed25519.pub  
    \> id_rsa.pub

   ```
    [bradw@yeti-login02 ~] ls -la ~/.ssh/
    total 8
    drwx------.  2 bradw users   24 Jul 20 10:23 .
    drwxr-xr-x. 34 bradw users 4096 Jul 20 09:21 ..
    -rw-r--r--.  1 bradw users  408 Jul 20 09:15 known_hosts
   ```

3. Generate an SSH key  
    Enter the command:  
    `ssh-keygen`

   ```
    [bradw@yeti-login02 ~] ssh-keygen 
    Generating public/private rsa key pair.
    Enter file in which to save the key (/home/bradw/.ssh/id_rsa): 
    Enter passphrase (empty for no passphrase): 
    Enter same passphrase again: 
    Your identification has been saved in /home/bradw/.ssh/id_rsa.
    Your public key has been saved in /home/bradw/.ssh/id_rsa.pub.
    The key fingerprint is:
    10:c5:c2:27:b2:3a:68:89:0d:02:bd:2c:39:29:a8:4c bradw@igskahcmvslih02.cbi.cr.usgs.gov
    The key's randomart image is:
    +--[ RSA 2048]----+
    | .   ..o.        |
    |. . . +.o        |
    |o+ . o.+         |
    |XEo .  .         |
    |B*..    S        |
    |+++              |
    |.  .             |
    |                 |
    |                 |
    +-----------------+
   ```

4. Verify you now have a SSH key  
    Enter the command:  
    `ls -la ~/.ssh`

   ```
    [bradw@yeti-login02 ~] ls -la ~/.ssh/
    total 16
    drwx------.  2 bradw users   54 Jul 22 19:22 .
    drwxr-xr-x. 34 bradw users 4096 Jul 20 09:21 ..
    -rw-------.  1 bradw users 1675 Jul 22 19:22 id_rsa
    -rw-r--r--.  1 bradw users  422 Jul 22 19:22 id_rsa.pub
    -rw-r--r--.  1 bradw users  408 Jul 20 09:15 known_hosts
   ```

5. Add you public key to the **authorized_keys** file
    Enter the command:  
    `cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys`

   ```
   [bradw@yeti-login02 ~] cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
   ```




#### MatLab example with sinteractive

SSH keys are required to launch an interactive shell with `sinteractive` command.

Mac users need to install [XQuartz](https://www.xquartz.org/) and Windows users need to install [Xming](https://gitlab.cr.usgs.gov/hpc-arc/yeti-user-docs/wikis/wiki/Xming). When you login to Yeti, use `-X` flag. For example, to run MatLab, you would first connect to Yeti with `-X` flag to enable X11 forwarding.

```
$ ssh -X yeti.cr.usgs.gov
[@yeti-login02 ~] sinteractive -p normal -A <your_account> -t 10:00 -n 1
.........
[@n3-96 ~]$ module load matlab/R2015b 
[@n3-96 ~]$ matlab
```
------



### **Congratulations!** 

You have completed the Yeti Quick-start tutorial. You can use the batch scripts found in this tutorial as starting templates when you need to create scripts to run your own code on Yeti.