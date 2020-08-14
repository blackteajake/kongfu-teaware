#!/bin/bash

#################################################################
# Kongfu Teaware
# https://github.com/blackteajake/gongfu-teaware
#################################################################

#################################################################
# 环境及shell使用相关
#################################################################
# 命令行提示符显示当前目录的全路径，如：JK@jkmac:/Users/jk/mygithub $
export PS1='\u@\h:$PWD \$ '

#################################################################
# Git 相关的命令：
# gs    : git status 的缩写，这个命令使用太频繁了
# gb    : git branch 的缩写，列出所有分支
# gl    : git log 的缩写，用颜色和图形化显示当前分支的commit log
# mygl  : my git log 的缩写，只显示自己的commit log
# gpull : git pull 的缩写，拉取当前分支的origin远端代码，不弹出编辑器
# gpush : git push 的缩写，推送当前分支代码到origin远端
#################################################################
alias 'gs'='git status'
alias 'gb'='git branch -a'

gl() {
  git log --graph --pretty=format:'%Cred%h%Creset %C(green)【%an】%C(yellow)%d%Creset %s (%ci)%Creset' $(git rev-parse --abbrev-ref HEAD)
}

mygl() {
  git log --graph --pretty=format:'%Cred%h%Creset %C(green)【%an】%C(yellow)%d%Creset %s (%ci)%Creset' $(git config --list | grep user.name | awk -F= '{print"--author="$2}' | xargs)
}

gpull() {
  git pull --no-edit origin $(git rev-parse --abbrev-ref HEAD)
}

gpush() {
  git push origin $(git rev-parse --abbrev-ref HEAD)
}

gcommit() {
  m=${1:-"no comment"}
  git commit -a -m $m
}

#git status 能正确显示中文
git config --global core.quotepath false

#################################################################
# 文件copy、scp、rsync等操作，数据备份相关
# scp-continue  使用跟scp，但支持断点续传
# find-zip      将find的输出zip成一个包，用法如：
#               find-zip ./ -name "*.doc" ~/doc.zip
#               将当前目录下的doc文件压缩成 ～/doc.zip
#################################################################
alias 'scp-continue'='rsync -P -e ssh'

find-zip() {
  # 除最后那个参数
  findArg=${@:1:$#-1}
  # 最后那个参数
  zipOut=${@: -1}
  find $findArg -print | zip -r9 $zipOut -@
}

#################################################################
# 计算相关
# calc		用起来比较自然的计算器，比如：calc '2*(1+2)' 输出：2*(1+2) = 6
# lc-dart	是line count dart的缩写，统计dart工程的代码行数，用法 ：
#         lc-dart </path/to/project>
#         不带参数表示在当前目录进行统计
# lc-android  统计android工程代码行数
#################################################################
calc() {
  sqlite3 --line :memory: 'select '$1';'
}

lc-dart() {
  path="${1:-.}"
  echo $path
  find $path -type f -name "*.dart" \
    -not -path "*/build/*" \
    -not -path "*/\.*" \
    -exec grep -cve '^\s*$' {} \; | awk '{sum+=$1}END{print sum}'
}

lc-android() {
  path="${1:-.}"
  echo $path
  find $path -type f \( -name "*.java" -o -name "*.kt" \) \
    -not -path "*/build/*" \
    -not -path "*/\.*" \
    -not -path "*/node_modules/*" \
    -exec grep -cve '^\s*$' {} \; | awk '{sum+=$1}END{print sum}'
}

lc-ios() {
  path="${1:-.}"
  echo $path
  find $path -type f \( -name "*.h" -o -name "*.m" -o -name "*.mm" -o -name "*.swift" \) \
    -not -path "*/build/*" \
    -not -path "*/\.*" \
    -not -path "*/node_modules/*" \
    -exec grep -cve '^\s*$' {} \; | awk '{sum+=$1}END{print sum}'
}

lc-cpp() {
  path="${1:-.}"
  echo $path
  find $path -type f \( -name "*.h" -o -name "*.hpp" -o -name "*.c" -o -name "*.cpp" \) \
    -not -path "*/build/*" \
    -not -path "*/\.*" \
    -exec grep -cve '^\s*$' {} \; | awk '{sum+=$1}END{print sum}'
}

#################################################################
# 格式规范、格式转换相关
#################################################################
