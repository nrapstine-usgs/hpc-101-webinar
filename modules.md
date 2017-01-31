### Section 14: Loading Environment Modules on Yeti

Before we run any code, let's look at our available modules on Yeti. On Yeti you can load environment modules to dynamically modify your environment. To check which modules are available on Yeti you can use the **module avail** command.

Enter the command: `module avail`

Your output should look something like this:

```
--------------------------------------------- /usr/share/Modules/modulefiles ---------------------------------------------
dot         module-git  module-info modules     null        use.own

---------------------------------------------------- /etc/modulefiles ----------------------------------------------------
allinea/6.0.6                           libtool/2.4.6-gcc                       python/python-2.7
autoconf/2.69-gcc                       libtool/2.4.6-intel                     qiime/1.9.2
autoconf/2.69-intel                     m4/1.4.17-gcc                           rstudio/0.98.1103
automake/1.15-gcc                       matlab/mcr-R2013a-v81                   spack
automake/1.15-intel                     matlab/R2014b                           stacks/1.35
bayesass/3.0.4-gnu                      matlab/R2015b                           standard-RAxML/8.2.9-gcc
beopest/beopest-13.6-gcc-openmpi-1.10.2 mct/2.8-intel                           stereopipeline/2.4.2
beopest/beopest-13.6-intel              mct/2.9-gcc                             stereopipeline/2.5.0
boost/1.59.0-gcc                        mega/7.0.20                             stereopipeline/2.5.1
...
```

To determine which modules are currently loaded in your environment, you can use the **module list** command.

*Enter the Command:* `module list` ​

You should see output similar to the following:

```
No Modulefiles Currently Loaded.
```

Before we run our `helloworld.py` code, let's look at our default python environment.

Enter the command:
`which python`

Enter the command:
`python --version`

Your output should look similar to the following:

```
$ which python
/usr/bin/python
$ python --version
Python 2.6.6
```

In order to run our `helloworld.py` file we need to load 2 different modules: **mpi/mpich-x86_64** and **python/anaconda**

Enter the Command:

```
$ module load mpi/mpich-x86_64 python/anaconda
```

Now run the `module list` command again. You should now see the modules loaded.

```
$ module list
Currently Loaded Modulefiles:
  1) mpi/mpich-x86_64   2) python/anaconda
```

Now, check your python environment again.

Enter the command:
`which python`

Enter the command:
`python --version`

With the modules loaded you should now see:

```
$ which python
/cxfs/projects/root/opt/anaconda/bin/python
$ python --version
Python 2.7.13 :: Anaconda custom (64-bit)
```

To remove the modules, you will use the **module purge** command.

Enter the command:
`module purge`

Enter the command:
`module list`

```
$ module purge
$ module list
No Modulefiles Currently Loaded.
```

### Python environment setup with conda

Load the module:

Load python/anaconda2 or python/anaconda3 module:

```
@yeti-login20> module load python/anaconda3

```

Create a local enviroment:

```
@yeti-login20> conda create --name py35 python=3.5

```

Activate you enviroment and list packages:

```
@yeti-login20> source activate py35
(py35) @yeti-login20>  pip list
pip (9.0.1)
setuptools (27.2.0)
wheel (0.29.0)

```

Install your packages:

```
(py35)@yeti-login20>  pip install numpy
...
Successfully installed numpy-1.12.0

(py35)@yeti-login20> pip list
numpy (1.12.0)
pip (9.0.1)
setuptools (27.2.0)
wheel (0.29.0)

```

When finished, deactivate you enviroment:

```
(py35)@yeti-login20> source deactivate py35

```

Remember to always load the module before activating the enviroment.

------

Go to Section 15: [submitting jobs with sbatch](batch.md)