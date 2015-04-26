#!/bin/bash

awk 'BEGIN{P=0}{
    IP="\033[1;34m"$1"\033[0m"
    CODE=$9
    if (CODE ~ /"-"/){P=0; next}
    DATE="\033[1;36m"$4"]""\033[0m"
    if ($9 == "404")
        CODE="(\033[1;31m" $9 "\033[0m)"
    else if ($9 == "200")
        CODE="(\033[1;32m" $9 "\033[0m)"
    else CODE="(" $9 ")"
    # if(length(IP) != 0){
        print "> " IP " | " DATE " | " CODE " | " $6 " : " $7 " => " $12 $13 $14
    # }
}' < /var/log/nginx/access.log
