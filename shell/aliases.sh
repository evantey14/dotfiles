# Easier navigation
alias mit="cd ~/universe/mit"
alias dls="cd ~/downloads"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"

# Print each PATH entry on a separate line
alias path="echo -e ${PATH//:/\\\\n}"

alias ls="ls --ignore=Desktop --ignore='Dropbox (MIT)' --color=tty"

# Quick usb mounting
alias mntusb="sudo mount /dev/sda1 /mnt"
alias unmntusb="sudo umount /mnt"

# Docker aliases
alias dockrun="docker-compose exec server"
alias dockman="docker-compose exec server python manage.py"
