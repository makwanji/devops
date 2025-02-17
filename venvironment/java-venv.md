# JAVA Virtual Environment setup - Using jenv

1. Install jenv:
```bash
brew install jenv
```

2. Add jenv to your shell

```bash
echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(jenv init -)"' >> ~/.zshrc
source ~/.zshrc
```

3. Install multiple Java versions

```bash
brew install openjdk@17
brew install openjdk@11

# create soft link
sudo ln -sfn /opt/homebrew/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk
sudo ln -sfn /opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-17.jdk
```

4. Add Java versions to jenv

```bash
jenv add /Library/Java/JavaVirtualMachines/openjdk-17.jdk/Contents/Home
jenv add /Library/Java/JavaVirtualMachines/openjdk-11.jdk/Contents/Home
```


5. list the java version available
```bash
jenv versions
```

6. Set Global and Local Java Versions

```bash
#Global
jenv global 17
java -version

# Local
cd /path/to/project
jenv local 11
java -version
```
