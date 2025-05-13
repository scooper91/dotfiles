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

function AWS {
  [ $# -eq 0 ] && echo "Usage: $0 \$PROFILE [\$COMMAND]" && return
  local id=$(aws configure get $1.aws_access_key_id)
  local key=$(aws configure get $1.aws_secret_access_key)
  [ -z $id ] && echo "No credentials for profile '$1'" && return 1
  if [ $# -eq 1 ]; then
    export AWS_ACCESS_KEY_ID=$id; export AWS_SECRET_ACCESS_KEY=$key
    export AWS_PROFILE=$1
    echo "Exported credentials for profile '$1'"
    return
  fi
  AWS_ACCESS_KEY_ID=$id AWS_SECRET_ACCESS_KEY=$key "${@:2}"
}
