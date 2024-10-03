# htpass Auth

```bash
# generate a htpasswd file
htpasswd -c -B -b jightpass.txt jig redhat
## -c - create a file
## -B - encript a file
## -b - provide password on command line

# Add user
htpasswd -B -b jightpass.txt charlie redhat
htpasswd -B -b jightpass.txt ted redhat


# check content of the file
cat jightpass.txt

```

my-htpass-file
htpass-secret