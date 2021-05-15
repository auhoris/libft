# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: auhoris <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/25 15:29:16 by auhoris           #+#    #+#              #
#    Updated: 2021/05/15 14:13:18 by auhoris          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		= libft.a

SRCDIR		= srcs
BONUSDIR	= bonus
OBJDIR		= objs
INCDIR		= includes

SRCS		= $(wildcard $(SRCDIR)/*.c)
BONUS		= $(wildcard $(BONUSDIR)/*.c)
INCLUDES	= $(INCDIR)/libft.h
OBJS		= $(SRCS:$(SRCDIR)/%.c=$(OBJDIR)/%.o)
OBJSBONUS	= $(BONUS:$(BONUSDIR)/%.c=$(OBJDIR)/%.o)


RM			= rm -rf

CC			= gcc
CLAGS		= -Wall -Wextra -Werror

all:		$(NAME)

$(NAME):	$(OBJS)
			ar rcs $@ $^
			@echo "\033[0;32m"$@" compiled\033[0m"

bonus:		$(OBJSBONUS) $(OBJS) $(NAME)
			ar rcs $(NAME) $^
			# @echo "\033[0;32m"$(NAME)" compiled with bonus\033[0m"

$(OBJDIR)/%.o: $(SRCDIR)/%.c Makefile $(INCLUDES)
			@mkdir -p $(OBJDIR)
			$(CC) $(CLAGS) -c $< -o $@
			@echo "Compiled "$<" successfully!"

$(OBJDIR)/%.o: $(BONUSDIR)/%.c Makefile $(INCLUDES)
			@mkdir -p $(OBJDIR)
			$(CC) $(CLAGS) -c $< -o $@
			@echo "Compiled "$<" successfully!"

clean:
			$(RM) $(OBJDIR)

fclean:		clean
			$(RM) $(NAME)

re:			fclean all

.PHONY:		re fclean clean all bonus

.SILENT:	$(OBJS) $(OBJSBONUS) $(NAME) bonus
