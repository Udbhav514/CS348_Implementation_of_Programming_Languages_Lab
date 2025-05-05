
################################
# COMMANDS TO RUN THE FILES : make clean
#			 				  make
#			 			
################################


all: a.out
	
	./a.out < 220101106_test1.mc > 220101106_quads1.out
	@echo "Test File 1 Done. \n"
	./a.out < 220101106_test2.mc > 220101106_quads2.out
	@echo "Test File 2 Done. \n"
	./a.out < 220101106_test3.mc > 220101106_quads3.out
	@echo "Test File 3 Done. \n"
	./a.out < 220101106_test4.mc > 220101106_quads4.out
	@echo "Test File 4 Done. \n"
	./a.out < 220101106_test5.mc > 220101106_quads5.out
	@echo "Test File 5 Done. \n"

	@echo "\nAll Files Done. \n"

a.out: lex.yy.o y.tab.o translator_220101106.o
	g++ -std=c++11 lex.yy.o y.tab.o translator_220101106.o -lfl

translator_220101106.o: translator_220101106.cpp translator_220101106.h
	g++ -std=c++11 -c translator_220101106.h
	g++ -std=c++11 -c translator_220101106.cpp

lex.yy.o: lex.yy.c
	g++ -std=c++11 -c lex.yy.c

y.tab.o: y.tab.c
	g++ -std=c++11 -c y.tab.c

lex.yy.c: 220101106.l y.tab.h translator_220101106.h
	flex 220101106.l

y.tab.c: 220101106.y
	yacc -dtv 220101106.y -W

y.tab.h: 220101106.y
	yacc -dtv 220101106.y -W

clean:
	rm 220101106_quads1.out 220101106_quads2.out 220101106_quads3.out 220101106_quads4.out 220101106_quads5.out  lex.yy.c y.tab.c y.tab.h lex.yy.o y.tab.o translator_220101106.o y.output a.out translator_220101106.h.gch
	
