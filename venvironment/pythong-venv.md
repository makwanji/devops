# Python VEnvironment

0. Install dependencies
```bash
brew install openssl readline xz zlib
brew install xz zlib bzip2 readline sqlite openssl
```

1. Install penv
```bash
brew install pyenv
```

2. Update Shell Configuration

```bash
# pyenv setup
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
```

3. Install Python Versions

```bash
pyenv install 3.11.6
pyenv install 3.10.12
pyenv install 3.9.18
```

4. Set Global or Local Python Versions

```bash
pyenv global 3.11.6
pyenv local 3.10.12
```

5. Check Python Versions

```bash
python --version
pyenv version
pyenv versions


CFLAGS="-I$(brew --prefix)/include" LDFLAGS="-L$(brew --prefix)/lib" pyenv install --force <python_version>
CFLAGS="-I$(brew --prefix)/include" LDFLAGS="-L$(brew --prefix)/lib" pyenv install --force 3.11.6
```