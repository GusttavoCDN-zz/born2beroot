#!/bin/bash

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    set_firewall.sh                                    :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: otaku <otaku@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/09 23:50:23 by otaku             #+#    #+#              #
#    Updated: 2022/06/09 23:50:23 by otaku            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

PORT=$1

sudo ufw enable
systemctl enable ufw
sudo ufw allow {PORT}
sudo ufw status

