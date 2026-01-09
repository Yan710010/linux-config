if status is-interactive && set -q SSH_CONNECTION
    set data "$(cat ~/.ssh/hosts.json)"
    set -x SSH_USER_HASH \
        (journalctl --no-pager --reverse --lines=4 --output=cat --unit=sshd.service \
        | rg --only-matching --color=never --max-count=1 "SHA256:[A-Za-z0-9\+\/]{43}")

    set -x SSH_USER_EXISTS \
        (echo $data | jq --raw-output "has(\"$SSH_USER_HASH\")")
    set -x SSH_USER_NAME \
        (echo $data | jq --raw-output ".[\"$SSH_USER_HASH\"]" )
    if test $SSH_USER_NAME != Yan -a $SSH_USER_NAME != 27Onion
        # 发送提示语
        if test $SSH_USER_EXISTS = true
            notify-send --app-name SSH --urgency critical "有人连上来了喵?" "公钥所有者: $SSH_USER_NAME, 于 $(date +"%Y/%m/%d %H:%M:%S")"
        else
            notify-send --app-name SSH --urgency critical "有人连上来了喵?" "公钥: $SSH_USER_HASH, 于 $(date +"%Y/%m/%d %H:%M:%S")"
        end
    end
    # motd
    echo $data | jq --raw-output ".[\"$SSH_USER_NAME\"]"
end
