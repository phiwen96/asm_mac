
helloworld1: helloworld1.o
	ld -e start -static helloworld1.o -o helloworld1

helloworld1.o: helloworld1.asm 
	nasm -f elf64 -g -F stabs helloworld1.asm -o helloworld1.o


helloworld: helloworld.o
	ld -e start -static helloworld.o -o helloworld

helloworld.o: helloworld.asm
	nasm -f elf64 -g -F stabs helloworld.asm -o helloworld.o

test: test.o
	ld -e main -static test.o -o test

test.o: test.asm
	nasm -f elf64 -g -F stabs test.asm -o test.o

