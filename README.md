Pepinot 86
==========

Overview
--------
Pepinot 86 is a experimental 16-bit operating system written in x86 assembly
and to a lesser extent, ANSI C.

Pepinot 86 is named after the orphan from the 2004 French film - *The Chorus* (*Les choristes*) with
86 coming from the x86 architecture. It's designed is inspired by MS-DOS, Linux and Mike Saunders' [MikeOS](http://mikeos.berlios.de).

It is being developed principally on Windows 7 with *make* from [MinGW/MSYS](http://www.mingw.org), [NASM](http://www.nasm.us) assembler, a [mkisofs port](http://smithii.com/cdrtools) and a [dd port](http://www.chrysocome.net/dd). 

It is tested in [QEMU](http://www.h7.dion.ne.jp/~qemu-win) (floppy image) and [VirtualBox](http://www.virtualbox.org) (CD/ISO image).

Status
------
Pepinot 86 is in the *very early* stages of development of the monolithic kernel 
itself.

Applications planned
---------------------

* `asm`: an x86 assembler.
* `cc`: an ANSI C compiler.
* `basic`: a BASIC intepreter.
* `build`: an implementation of the historical 'make' utility, a build tool.
* `ed`: a CLI text editor a la Vi.
* `edit:` a semi-GUI text editor a la MS-DOS Edit.
* `hex:`: a hexidecimal binary editor.

And maybe some games.

License
-------
Pepinot x86 is released under the MIT/X11 license.
