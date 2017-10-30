#!/bin/bash

PYTHON_VERSION=2.7.12

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
