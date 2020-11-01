source ~/.shell/functions.sh
source ~/.shell/boostrap.sh
source ~/.shell/aliases.sh

# Allow local customizations in the ~/.bashrc_local file
if [ -f ~/.bashrc_local ]; then
    source ~/.bashrc_local
fi
