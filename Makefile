# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dzboncak <dzboncak@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/11/24 19:28:38 by bkiehn            #+#    #+#              #
#    Updated: 2019/07/11 18:09:06 by dzboncak         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = lem-in

_SRC =	ant.c \
		ants_contribution.c \
		bfs.c \
		get_pathes.c \
		link.c \
		main.c \
		node.c \
		path.c \
		print.c \
		read_rooms.c \
		read.c \
		sort.c

SRC = $(addprefix src/,$(_SRC))

OBJS = $(patsubst src/%.c,obj/%.o,$(SRC))

FLAGS = -Wall -Wextra -Werror

INC = ./includes

LIBAFERST = make -C $(LIBRARY)

LIBRARY = libft
	
$(NAME): $(OBJS)
	@$(LIBAFERST)
	gcc -o $(NAME) $(OBJS) -I $(INC) -L ./$(LIBRARY) -lft -lftprintf

liba:
	make -C $(LIBRARY)

obj/%.o: src/%.c
	@mkdir -p obj
	gcc -c $< -o $@ -I $(INC)

debug:
	gcc -g3 -o $(NAME) $(src) -I $(INC) -L ./$(LIBRARY) -lft -lftprintf

clean:
	rm -f $(OBJS)
	make -C $(LIBRARY) clean

fclean: clean
	rm -f $(NAME)
	make -C $(LIBRARY) fclean
	
re: fclean libare
	gcc -o $(NAME) $(FLAGS) $(src) -I $(INC) -L ./$(LIBRARY) -lft -lftprintf

libare:
	make -C $(LIBRARY) re