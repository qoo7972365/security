#!/bin/sh
whoami_txt=$(who am i)
login_ip=$(echo $whoami_txt | awk -F"[()]" '{print $2}')
login_user=$(echo $whoami_txt | awk '{print $1}')
login_tty=$(echo $whoami_txt | awk '{print $2}')
> .bash_history
export PROMPT_COMMAND='{ date "+%Y-%m-%d %T ## `hostname` ## $login_user ## $login_tty ## $login_ip ## USER=$(whoami) PWD=$(pwd) CMD=$(history 1| { read x cmd; echo "$cmd"; })"; } >> /var/log/.histlog'
if [[ -z `readonly -p | grep PROMPT_COMMAND` ]];then readonly PROMPT_COMMAND;fi
