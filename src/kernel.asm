;
; Pepinot 86 operating system
; 16-bit mimimal operating system for x86
; Copyright (c) 2011 Sam Saint-Pettersen.
;
; Released under the MIT/X11 License
;
; PEPINOT 86 KERNEL
; The kernel code is heavily based
; on Mike Saunders sample code from:
; http://mikeos.berlios.de/write-your-own-os.html
;

	BITS 16
start:
	mov ax, 0x07C0		; Set up 4kb stack space after this bootloader.
	add ax, 288		; (4096 + 512) / 16 bytes per paragraph.
	mov ss, ax
	mov sp, 4096

	mov si, msg_string	; Put string position into SI. 
	call print_string	; Call print_string routine.

	jmp $			; Jump here; infinite loop.

	msg_string db 'Welcome to Pepinot 86.', 0

print_string:
	mov ah, 0Eh		; Routine: print_string 
				; Output string in SI to screen.

.repeat:
	lodsb			; Get character from string.
	cmp al, 0
	je .done		; If char is zero, end of string.
	int 0x10		; Otherwise, print it.
	jmp .repeat

.done:
	ret

	times 510 - ($-$$) db 0	; Pad remainder of boot sector with 0s
	dw 0xAA55		; The standard PC boot signature.

