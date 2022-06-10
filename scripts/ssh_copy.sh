# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ssh_copy.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: otaku <otaku@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/09 23:32:29 by otaku             #+#    #+#              #
#    Updated: 2022/06/09 23:43:39 by otaku            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

GREEN="\033[0;32m"

echo -e "The command to copy a file to the server is:"$GREEN
echo scp -P [port] filename [user]@[ip]:newfilepath 