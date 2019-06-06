# git-sniff
## Intro
This script extends git with sniff command, which lets you link your code sniffer with git. It will trigger code sniffer for staged files by running simple ```git sniff``` command. 
If batch mode is on, code sniffer will be executed before each commit preventing committing files that don't comply with coding standards.
## Installation
### Move git-sniff script to system executable directory
```mv git-sniff.sh /usr/bin/git-sniff && chmod +x /usr/bin/git-sniff```
### Copy pre-commit hook
Copy the content of ```pre-commit.sh``` to ```/path/git-repository/.git/hooks/pre-commit```. Run ```[ -x /path/git-repository/.git/hooks/pre-commit ] || chmod +x 
/path/git-repository/.git/hooks/pre-commit``` to make sure ```/path/git-repository/.git/hooks/pre-commit``` is executable.
## Usage
```git sniff```
## Configuration
### Sniffer executable file
Path or name of sniffer executable file. ```git config --add sniff.cmd <value>```
### Parameters to pass to sniffer command
You can set additional parameters that will be passed to sniffer command. ```git config --add sniff.params <value>```
### Batch mode
Sniffer will be executed for all files if value is set to ```1```, otherwise sniffer will be executed separately. ```git config --add sniff.batchmode <value>```
### Execute sniffer on commit
Sniffer will be executed on each commit if value is set to ```1```. Commit won't be performed if files don't comply with coding standards. ```git config --add sniff.oncommit 
<value>```
## PHP Code Sniffer example
Here is an example of linking PHP Code Sniffer with git.
### Usiging phpcs.xml configuration
Make sure you created ```phpcs.xml``` file in your project root directory. ```git config --add sniff.cmd /path/to/phpcs git config --add sniff.batchmode 1```
### Using command line configuration
```git config --add sniff.cmd /path/to/phpcs git config --add sniff.params "--standard=PSR2"```
