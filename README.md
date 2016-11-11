# Env upgrade

This little `bash` script updates the packages used by the following tools:

 * Homebrew
 * Python 2.x, 3.x
 * Ruby gems
 
Instead of having to type this over and over again I automated the process; it checks 
if the command is found in your `PATH` and only then it tries to perform the operation.

# Usage details

Just download the script (or clone the repo) and run the `env_upgrade.sh` script. You 
might have to give execution privileges on the script before running depending your
configuration, you can do that by using the following command:

```
$ chmod +x ./env_upgrade.sh
```

I've tested this on `Unix`-like systems; in particular on MacOS (> 10.10) and Ubuntu (> 15.04).