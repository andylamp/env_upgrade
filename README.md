# Env upgrade

This little `bash` script updates the packages used by the following tools:

 * Homebrew
 * Python 2.x, 3.x
 * Ruby gems
 
Instead of having to type this over and over again I automated the process; it checks 
if the command is found in your `PATH` and only then it tries to perform the operation.

It has been tested on `Unix`-like systems; in particular on MacOS and Ubuntu.