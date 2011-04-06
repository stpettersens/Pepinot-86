#
# Makefile for Pepinot 86 operating system
#
make:	build

build:
	nasm -f bin -o bin/kernel.bin src/kernel.asm
	dd if=bin/kernel.bin of=bin/kernel.flp
	rm -f bin/kernel.bin

copy:	build
	cp bin/kernel.flp C:/Dev/qemu-0.9.0-windowsa

