# git-sniff

## Installation

### Move git-sniff script to system executable directory

```mv git-sniff.sh /usr/bin/git-sniff && chmod +x /usr/bin/git-sniff```

### Copy pre-commit hook

Copy the content of ```pre-commit.sh``` to ```/path/git-repository/.git/hooks/pre-commit```

## Usage

```git sniff```

## Configuration

```git config --add sniff.cmd <value>```
```git config --add sniff.params <value>```
```git config --add sniff.batchmode <value>```
```git config --add sniff.oncommit <value>```
