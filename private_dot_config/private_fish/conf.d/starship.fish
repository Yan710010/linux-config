if test "$TERM" = linux || ! status is-interactive
    return
end

function starship_transient_prompt_func
  echo
  starship module time
  starship module directory
  echo
  printf "\x1b[38;2;44;211;211m\x1b[0m "
end
starship init fish | source
enable_transience

