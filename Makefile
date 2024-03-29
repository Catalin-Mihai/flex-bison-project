CC=g++
CFLAGS= -Wall -Wextra
NAME=a.out # numele executabilului final

SRCS_CPP := $(wildcard *.cpp)
SRCS_HPP := $(wildcard *.hpp)
SRCS_O := $(SRCS:%.cpp=%)

build: scanner.l parser.y
	bison -o parser.cpp -d parser.y
	flex -o scanner.cpp scanner.l
	@echo "\nBuild finished"
	
compile: $(SRCS_CPP) $(SRCS_HPP)
	@$(CC) $(CFLAGS) $(SRCS_CPP) -o $(NAME)
	@echo "\nCompile finished"

run:
	./$(NAME)