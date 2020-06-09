# gongfu-teaware
将一些常用的任务变成自己容易记住、信手拈来的命令/工具。
这些命令只需要简单地粘贴在`.bash_profile`文件末尾，你就可以使用。

```shell

# 命令行提示符开头，显示当前目录的全路径，如：JK@jkmac:/Users/jk/mygithub $
export PS1='\u@\h:$PWD \$ '



#################################################################
# Git 相关的命令：
# gs    相当于git status，这个命令使用太频繁了
# gb    列出分支
# gl    以美观的样式，显示当前分支的commit log
# mygl  只显示自己的commit log
# gpull pull当前分支代码，不弹出编辑器
# gpush push当前分支代码到origin远端
#################################################################
alias 'gs'='git status'
alias 'gb'='git branch -a'
alias 'gl' ="git log --graph --pretty=format:'%Cred%h%Creset %C(green)【%an】%C(yellow)%d%Creset %s (%ci)%Creset' `git rev-parse --abbrev-ref HEAD`"
alias 'glme'="git log --graph --pretty=format:'%Cred%h%Creset %C(green)【%an】%C(yellow)%d%Creset %s (%ci)%Creset' --author=`git config --list | grep user.name | awk -F= '{print$2}'`"

alias 'gpull'="git pull --no-edit origin `git rev-parse --abbrev-ref HEAD`"
alias 'gpush'="git push origin `git rev-parse --abbrev-ref HEAD`"

#git status 能正确显示中文
git config --global core.quotepath false




#################################################################
# 文件copy、scp、rsync等操作，数据备份相关
# scp-continue  使用跟scp，但支持断点续传
#################################################################
alias 'scp-continue'="rsync -P -e ssh "





```
