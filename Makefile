hello: hello.S
	as -g hello.S -o hello.o
	ld hello.o -o hello

clean: 
	rm hello.o hello
