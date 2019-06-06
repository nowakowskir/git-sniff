# git-sniff

## Installation

### Move git-sniff script to system executable directory

```mv git-sniff.sh /usr/bin/git-sniff && chmod +x /usr/bin/git-sniff```

### Copy pre-commit hook

Copy the content of ```pre-commit.sh``` to ```/path/git-repository/.git/hooks/pre-commit```

## Usage

```git sniff```

## Configuration

### Sniffer executable file

Path or name of sniffer executable file.

```git config --add sniff.cmd <value>```

### Parameters to pass to sniffer command

You can set additional parameters that will be passed to sniffer command.

```git config --add sniff.params <value>```

### Batch mode

Sniffer will be executed for all files if value is set to ```1```, otherwise sniffer will be executed separately.

```git config --add sniff.batchmode <value>```

### Execute sniffer on commit

Sniffer will be executed on each commit if value is set to ```1```. Commit won't be perfomed if files don't comply with coding standards.

```git config --add sniff.oncommit <value>```
