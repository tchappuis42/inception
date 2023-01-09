# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tchappui <tchappui@student.42lausanne.c    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/15 14:56:24 by tchappui          #+#    #+#              #
#    Updated: 2022/12/15 15:43:50 by tchappui         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


RM		= rm -f

SRCS	= -f srcs/docker-compose.yml

DOCKERCOMPOSE	= docker compose

BUILD = build

UP = up -d

all: build start 

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

start:
		$(DOCKERCOMPOSE) $(SRCS) $(UP)

clean: 
		$(DOCKERCOMPOSE) $(SRCS) down --volumes
		$(RM) ~/data/wordpress/*
		$(RM) ~/data/db-data/*
		
re:			clean all