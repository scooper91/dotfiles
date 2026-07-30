alias g=git
alias gs='git status'
alias gc='git commit'
alias gca='git commit --amend'
alias gcaq='git commit --amend --no-edit'
alias ga='git add'
alias gaa='git add --all'
alias gch='git checkout'
alias gr='git reset'
alias gd='git diff'
alias gdc='git diff --cached'
alias gps='git push'
alias gpl='git pull'
alias gplr='git pull --rebase --autostash'
alias gl='git log'

function aws_login {
  aws sso login --profile $1
  eval $(aws configure export-credentials --profile $1 --format env)
  export AWS_REGION=eu-central-1
  echo Exported credentials as environment variables.
}

alias uptmux='upterm host --force-command '\''tmux attach -t pair-programming'\'' -- tmux new-session -As pair-programming'
