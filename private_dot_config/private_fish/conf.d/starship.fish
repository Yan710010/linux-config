if test "$TERM" = linux || ! status is-interactive
    return
end

function starship_transient_prompt_func
  echo
  starship module time
  starship module directory
  starship module character
end
starship init fish | source
enable_transience

