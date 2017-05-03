#!/bin/bash

CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

printf "#!/bin/bash\n\
\n\
source $CURR_DIR/bashrc\n" > ~/.bashrc
