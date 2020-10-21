# Bash history

## Disable
File `~/.bash_profile`
```
unset HISTFILE
export SHELL_SESSION_HISTORY=0
```

Link this on `.bashrc`

```bash
cd
ln -s ".bash_profile" ".bashrc"
```
## Clear bash sessions
```bash
rm -P ~/.bash_sessions/*
```

Create dir `~/.bash_sessions_disable`
