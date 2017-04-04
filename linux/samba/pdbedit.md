# pdbedit
## Parameters
```
Использование: [ПАРАМЕТР...]
  -L, --list                            list all users
  -v, --verbose                         be verbose
  -w, --smbpasswd-style                 give output in smbpasswd style
  -u, --user=USER                       use username
  -N, --account-desc=STRING             set account description
  -f, --fullname=STRING                 set full name
  -h, --homedir=STRING                  set home directory
  -D, --drive=STRING                    set home drive
  -S, --script=STRING                   set logon script
  -p, --profile=STRING                  set profile path
  -I, --domain=STRING                   set a users' domain
  -U, --user SID=STRING                 set user SID or RID
  -M, --machine SID=STRING              set machine SID or RID
  -a, --create                          create user
  -r, --modify                          modify user
  -m, --machine                         account is a machine account
  -x, --delete                          delete user
  -b, --backend=STRING                  use different passdb backend as default backend
  -i, --import=STRING                   import user accounts from this backend
  -e, --export=STRING                   export user accounts to this backend
  -g, --group                           use -i and -e for groups
  -y, --policies                        use -i and -e to move account policies between backends
      --policies-reset                  restore default policies
  -P, --account-policy=STRING           value of an account policy (like maximum password age)
  -C, --value=LONG                      set the account policy to this value
  -c, --account-control=STRING          Values of account control
      --force-initialized-passwords     Force initialization of corrupt password strings in a passdb backend
  -z, --bad-password-count-reset        reset bad password count
  -Z, --logon-hours-reset               reset logon hours
      --time-format=STRING              The time format for time parameters
  -t, --password-from-stdin             get password from standard in
  -K, --kickoff-time=STRING             set the kickoff time

Help options:
  -?, --help                            Show this help message
      --usage                           Display brief usage message

Common samba options:
  -d, --debuglevel=DEBUGLEVEL           Set debug level
  -s, --configfile=CONFIGFILE           Use alternate configuration file
  -l, --log-basename=LOGFILEBASE        Base name for log files
  -V, --version                         Print version
      --option=name=value               Set smb.conf option from command line
```
