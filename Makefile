# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tchappui <tchappui@student.42lausanne.c    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/15 14:56:24 by tchappui          #+#    #+#              #
#    Updated: 2023/01/20 15:50:05 by tchappui         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


RM		= rm -rf

SRCS	= -f srcs/docker-compose.yml

DOCKERCOMPOSE	= docker-compose

BUILD = build

UP = up -d

all: build up 

mariadb: 
		$(DOCKERCOMPOSE) $(SRCS) $(BUILD) mysql 
		$(DOCKERCOMPOSE) $(SRCS) $(UP) mysql

nginx: 
		$(DOCKERCOMPOSE) $(SRCS) $(BUILD) nginx 
		$(DOCKERCOMPOSE) $(SRCS) $(UP) nginx

wordpress: 
		$(DOCKERCOMPOSE) $(SRCS) $(BUILD) wordpress
		$(DOCKERCOMPOSE) $(SRCS) $(UP) wordpress

build: 
		$(DOCKERCOMPOSE) $(SRCS) $(BUILD)

up:
		$(DOCKERCOMPOSE) $(SRCS) $(UP)

down:
		$(DOCKERCOMPOSE) $(SRCS) down
	
clean:		down
		docker system prune -a

fclean:		clean 
		$(RM) /home/tchappui/data/wordpress/*
		$(RM) /home/tchappui/data/db-data/*

re:			fclean all
