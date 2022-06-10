#!/bin/bash

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    monitoring.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: otaku <otaku@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/09 23:29:02 by otaku             #+#    #+#              #
#    Updated: 2022/06/09 23:29:04 by otaku            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SYSTEM_ARCHITECTURE=$(uname -a)
PHYSICAL_CPU=$(lscpu | grep "CPU(s):" | sed -n "1p" | awk '{ print $2 }')
VIRTUAL_CPU=$(grep "^processor" /proc/cpuinfo | wc -l)
MEMORY_USAGE=$(free -m | grep "Mem" | awk '{ printf("%d/%dMB (%.2f%%)", $3, $2, $3 / $2 * 100) }')
DISK_USED=$(df --total -BG | awk 'END{print $3}' | sed 's/G//g')
DISK_TOTAL=$(df --total -BG | awk 'END{print $2}')
DISK_PERCNT=$(df --total -BG | awk 'END{print $5}')
CPU_LOAD=$(top -bn1 | grep '%Cpu' | awk '{ printf("%.1f%%", 100 - $8) }')
LAST_BOOT=$(who -b | head -n 1 | awk '{ print $3, $4}')
LVM_USE=$(if [ $(lsblk | grep "lvm" | wc -l) -ge 1 ]; then echo yes; else echo no; fi)
TCP_CONNECTIONS=$(netstat -an | grep "ESTABLISHED" | wc -l)
USERS_ONLINE=$(who | wc -l)
IP_ADDRESS=$(hostname -I)
MAC_ADDRESS=$(ip link show | grep 'ether' | awk '{ print $2 }')
COMMANDS_EXEC=$(journalctl _COMM=sudo | grep COMMAND | wc -l)

wall "
#Architecture  : $SYSTEM_ARCHITECTURE
#CPU Physical  : $PHYSICAL_CPU
#vCPU   : $VIRTUAL_CPU
#Memory Usage: $MEMORY_USAGE
#Disk Usage : $DISK_USED/${DISK_TOTAL}b ($DISK_PERCNT)
#CPU load : $CPU_LOAD
#Last boot : $LAST_BOOT
#LVM use : $LVM_USE
#Connections TCP : $TCP_CONNECTIONS ESTABLISHED
#User log : $USERS_ONLINE
#Network : IP $IP_ADDRESS ($MAC_ADDRESS)
#Sudo : $COMMANDS_EXEC cmd"
