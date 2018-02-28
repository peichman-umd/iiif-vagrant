#!/bin/bash

PYTHON_VERSION=2.7.12

# GitHub requires newer TLS versions for HTTPS cloning
# see https://github.com/blog/2507-weak-cryptographic-standards-removed
export GIT_SSL_VERSION=tlsv1
# install pyenv (https://github.com/pyenv/pyenv-installer)
curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash

# set up profile
cat >$HOME/.pyenv.bash_profile <<END
export PATH="$HOME/.pyenv/bin:\$PATH"
eval "\$(pyenv init -)"
eval "\$(pyenv virtualenv-init -)"
END
cat >>$HOME/.bash_profile <<END
source "$HOME/.pyenv.bash_profile"
END

# install Python
source $HOME/.pyenv.bash_profile
pyenv install "$PYTHON_VERSION"
