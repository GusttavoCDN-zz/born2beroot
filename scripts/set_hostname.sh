#!/bin/bash

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    set_hostname.sh                                    :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: otaku <otaku@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/09 23:44:08 by otaku             #+#    #+#              #
#    Updated: 2022/06/09 23:44:30 by otaku            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NEW_HOSTNAME=$1

GREEN="\033[0;32m"
RESET="\033[0m"

sed -i "s/$HOSTNAME/$NEW_HOSTNAME/g" /etc/hosts
echo $NEW_HOSTNAME > /etc/hostname
echo $NEW_HOSTNAME > /proc/sys/kernel/hostname
echo -e "Hostname was changed to"$GREEN $NEW_HOSTNAME $RESET