function pager --wraps=exec --description 保留格式的运行程序并使用PAGER查看
    script /tmp/fish_pager -q -c "$argv" > /dev/null
    less -Rf /tmp/fish_pager 
    rm /tmp/fish_pager
end
