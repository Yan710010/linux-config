# 设置内置补全使用模糊匹配
$env.config.completions.algorithm = 'fuzzy'
# 使用fish进行外部补全
$env.config.completions.external = {
  enable: true
  completer: {|spans|
    # 是的前文明的人这样检测补全调用频率
    ^notify-send -e 哈哈我补全了
    fish --command $"complete '--do-complete=($spans | str replace --all "'" "\\'" | str join ' ')'"
    | from tsv --flexible --noheaders --no-infer
    | rename value description
    | update value {|row|
      let value = $row.value
      let need_quote = ['\' ',' '[' ']' '(' ')' ' ' '\t' "'" '"' "`"] | any {$in in $value}
      if ($need_quote and ($value | path exists)) {
        let expanded_path = if ($value starts-with ~) {$value | path expand --no-symlink} else {$value}
        $'"($expanded_path | str replace --all "\"" "\\\"")"'
      } else {$value}
    }
  }
}
