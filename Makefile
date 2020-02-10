all:
	lex project.l
	yacc -d project.y
	gcc -o project y.tab.c
clean:
	rm -f lex.yy.c
	rm -f y.tab.c
	rm -f y.tab.h
	rm -f project
	rm -f project.output
