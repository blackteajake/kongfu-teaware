# Kongfu Teaware （Useful shell command line）
将一些常用的任务变成自己容易记住、信手拈来的命令/工具。
这些命令只需要简单地粘贴在`.bash_profile`文件末尾，你就可以使用。

```shell
#################################################################
# Kongfu Teaware
# https://github.com/blackteajake/gongfu-teaware
#################################################################



#################################################################
# 环境配置相关
# 命令行提示符显示当前目录的全路径，如：JK@jkmac:/Users/jk/mygithub $
#################################################################
export PS1='\u@\h:$PWD \$ '



#################################################################
# Git 相关的命令：
# gs    是git status的缩写，这个命令使用太频繁了
# gb    是git branch的缩写，列出所有分支
# gl    是git log的缩写，用颜色和图形化显示当前分支的commit log
# mygl  是my git log的缩写，只显示自己的commit log
# gpull 是git pull的缩写，拉取当前分支的origin远端代码，不弹出编辑器
# gpush 是git push的缩写，推送当前分支代码到origin远端
#################################################################
alias 'gs'='git status'
alias 'gb'='git branch -a'

gl(){
  git log --graph --pretty=format:'%Cred%h%Creset %C(green)【%an】%C(yellow)%d%Creset %s (%ci)%Creset' `git rev-parse --abbrev-ref HEAD`
}

mygl(){
  git log --graph --pretty=format:'%Cred%h%Creset %C(green)【%an】%C(yellow)%d%Creset %s (%ci)%Creset' `git config --list | grep user.name | awk -F= '{print"--author="$2}' | xargs`
}

alias 'gpull'="git pull --no-edit origin `git rev-parse --abbrev-ref HEAD`"
alias 'gpush'="git push origin `git rev-parse --abbrev-ref HEAD`"

#git status 能正确显示中文
git config --global core.quotepath false




#################################################################
# 文件copy、scp、rsync等操作，数据备份相关
# scp-continue  使用跟scp，但支持断点续传
#################################################################
alias 'scp-continue'="rsync -P -e ssh "


#################################################################
# 计算相关
# calc		用起来比较自然的计算器，比如：calc '2*(1+2)' 输出：2*(1+2) = 6
# lc-dart	是line count dart的缩写，统计dart工程的代码行数
#################################################################
calc() {
  sqlite3 --line :memory: 'select '$1';'
}

lc-dart() {
  find . -type f \( -name "*.sh" -o -name "*.dart" \) -not -path "*/build/*" -not -path "*/\.*" | xargs grep -cve '^\s*$' | awk -F: '{sum+=$2}END{print sum}'
}





```
