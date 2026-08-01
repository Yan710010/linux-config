set -x GPG_TTY (tty)
function ssh
    gpg-connect-agent updatestartuptty /bye >/dev/null
    command ssh $argv
end
if test -n "$SSH_CONNECTION"
    set -x PINENTRY_USER_DATA "USE_CURSES=1"
    if test -z "$SSH_AUTH_SOCK"
        set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
    end
else
    set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
end
