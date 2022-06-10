#!/bin/bash

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install_packs.sh                                   :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: otaku <otaku@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/09 23:49:25 by otaku             #+#    #+#              #
#    Updated: 2022/06/09 23:49:48 by otaku            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

apt-get install sudo
apt-get install vim
apt-get install libpam-pwquality
apt-get install net-tools -y
apt-get install openssh-server openssh-client
apt-get install ufw
