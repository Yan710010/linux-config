# 设置……nu这边似乎叫瞬态提示符
$env.TRANSIENT_PROMPT_COMMAND = {||
  let dir = starship module directory | complete
  [
    "\n"
    $dir.stdout
    "\n"
    (ansi "#2cd3d3")
    "$ "
    (ansi reset)
  ] | str join
}
$env.TRANSIENT_PROMPT_COMMAND_RIGHT = ''
$env.TRANSIENT_PROMPT_INDICATOR = ''
$env.TRANSIENT_PROMPT_INDICATOR_VI_NORMAL = ''
$env.TRANSIENT_PROMPT_INDICATOR_VI_INSERT = ''
$env.TRANSIENT_PROMPT_MULTILINE_INDICATOR = ''

# 按下<C-c>时清空输入而非取消
$env.config.keybindings ++= [{
  name: clear_current_line
  modifier: control
  keycode: char_c
  mode: [emacs, vi_normal, vi_insert]
  event: { edit: Clear }
}]
