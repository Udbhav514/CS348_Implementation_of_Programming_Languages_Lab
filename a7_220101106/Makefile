# Makefile for micro C parser

CC = gcc
CFLAGS = -Wall -g

all: parser

parser: lex.yy.c y.tab.c
	$(CC) $(CFLAGS) -o parser lex.yy.c y.tab.c -lfl 

lex.yy.c: a7_220101106.l y.tab.h
	flex a7_220101106.l

y.tab.c y.tab.h: a7_220101106.y
	yacc -d a7_220101106.y

clean:
	rm -f parser lex.yy.c y.tab.c y.tab.h output.txt
	
test: parser
	./parser < a7_220101106_test.mc > output.txt