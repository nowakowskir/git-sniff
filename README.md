## Intro

This script extends git with sniff command, which lets you link your code sniffer with git. It triggers code sniffer command for staged files by running simple ```git sniff``` command.

code sniffer will be executed before each commit preventing committing files that don't comply with coding standards.

## Installation

### Move git-sniff script to system executable directory

```mv git-sniff.sh /usr/bin/git-sniff && chmod +x /usr/bin/git-sniff```

### Copy pre-commit hook

Copy the content of ```pre-commit.sh``` to ```/path/git-repository/.git/hooks/pre-commit```. Run ```[ -x /path/git-repository/.git/hooks/pre-commit ] || chmod +x /path/git-repository/.git/hooks/pre-commit``` to make sure ```/path/git-repository/.git/hooks/pre-commit``` is executable.

## Usage

By default you can sniff your staged files by running:

```git sniff```

## Configuration

### Sniffer executable file

Path or name of sniffer executable file.

```git config --add sniff.cmd <value>```

### Sniffer command's parameters

You can set additional parameters that will be passed to sniffer command.

```git config --add sniff.params <value>```

### Batch mode

You may need to run code sniffer separately or in batch mode depending on what method you prefer and what method your code sniffer supports.

If batch mode is on, code sniffer will be executed for all files at once passing list of staged files to sniffer command's input, otherwise command sniffer will be executed separately for each staged file.

You can turn on batch mode by running following command with ```1``` value:

```git config --add sniff.batchmode <value>```

### Execute sniffer on commit

Sniffer will be executed on each commit if value is set to ```1```. Commit won't succeed if files don't comply with defined coding standard.

```git config --add sniff.oncommit <value>```

## PHP Code Sniffer example

Here is an example of linking PHP Code Sniffer with git.

```
git config --add sniff.cmd phpcs
git config --add sniff.params "--standard=$(git rev-parse --show-toplevel)/phpcs.xml --colors"
```
