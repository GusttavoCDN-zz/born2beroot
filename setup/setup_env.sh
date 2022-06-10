#!/bin/bash

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup_env.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: otaku <otaku@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/09 23:49:02 by otaku             #+#    #+#              #
#    Updated: 2022/06/09 23:49:59 by otaku            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

chmod a+x *

./install_packs.sh

mkdir /var/log/sudo
sysetmctl enable apparmor

./set_firewall.sh
./set_passwdpolicy.sh