#!/bin/bash

#################################################################
# Kongfu Teaware
# https://github.com/blackteajake/gongfu-teaware
#################################################################

# 为ls输出增加颜色
alias 'ls'='ls -G'
alias 'll'='ls -G -l'



#################################################################
# 网络相关
# ip  查看本机IP
#################################################################
alias 'ipaddr'="ifconfig | grep 'status: active' -B 5 | grep netmask | xargs | awk '{print \$2}'"
