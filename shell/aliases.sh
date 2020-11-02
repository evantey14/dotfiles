# Easier navigation
alias mit="cd ~/universe/mit"
alias dls="cd ~/downloads"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Go up [n] directories
up()
{
    local cdir="$(pwd)"
    if [[ "${1}" == "" ]]; then
        cdir="$(dirname "${cdir}")"
    elif ! [[ "${1}" =~ ^[0-9]+$ ]]; then
        echo "Error: argument must be a number"
    elif ! [[ "${1}" -gt "0" ]]; then
        echo "Error: argument must be positive"
    else
        for ((i=0; i<${1}; i++)); do
            local ncdir="$(dirname "${cdir}")"
            if [[ "${cdir}" == "${ncdir}" ]]; then
                break
            else
                cdir="${ncdir}"
            fi
        done
    fi
    cd "${cdir}"
}

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"

# Print each PATH entry on a separate line
alias path="echo -e ${PATH//:/\\\\n}"

# Listing
if command -v exa &> /dev/null; then
    alias ls="exa -lg --git"
else
    alias ls="ls -lh --color=tty"
fi

# Protect against overwriting
alias cp="cp -i"
alias mv="mv -i"

# Update dotfiles
dfu() {
    (
        cd ~/dotfiles && git pull --ff-only && ./install -q
    )
}

# Create and enter directory
mcd() {
    mkdir "${1}" && cd "${1}"
}

# Execute a command in a specific directory
xin() {
    (
        cd "${1}" && shift && "${@}"
    )
}

# Quick usb mounting
alias mntusb="sudo mount /dev/sda1 /mnt"
alias unmntusb="sudo umount /mnt"

# Docker aliases
alias dockrun="docker-compose exec server"
alias dockman="docker-compose exec server python manage.py"
