if ! tmux has-session -t onion27 &> /dev/null
    tmux new -d -s onion27 -n 27 &> /dev/null &
end
