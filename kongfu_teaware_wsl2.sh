#!/bin/bash

#################################################################
# Kongfu Teaware
# https://github.com/blackteajake/gongfu-teaware
#################################################################

# 为ls输出增加颜色
alias 'ls'='ls --color'
alias 'll'='ls -l --color'


#################################################################
# 网络相关
# ip-local  查看本机IP
# ip-host   查看宿主机的IP
#################################################################

alias 'ip-local'="ip -h -br addr | grep UP | awk '{print \$3}' | awk -F'/' '{print \$1}'"
alias 'ip-host'="grep nameserver /etc/resolv.conf | awk '{print \$2}'"
