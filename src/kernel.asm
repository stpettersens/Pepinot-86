;
; Pepinot 86 operating system.
; 16-bit minimal operating system for x86.
; Copyright (c) 2011 Sam Saint-Pettersen.
;
; Released under the MIT/X11 License.
;
; PEPINOT 86 KERNEL
; The base of this kernel is heavily based
; on Mike Saunders' sample code from:
; http://mikeos.berlios.de/write-your-own-os.html
;

	BITS 16

;
; Bootloader
bootloader:
	mov ax, 0x07C0		; Set up 4kb stack space after this bootloader.
	add ax, 288			; (4096 + 512) / 16 bytes per paragraph.
	mov ss, ax
	mov sp, 4096

	mov ax, 0x07C0		; Set data segment to loaded location.
	mov ds, ax

	mov si, msg_string	; Print welcome message.
	call print_string
	mov si, newline		
	call print_string

	call get_date		; Print system date.
	mov si, dateformat
	call print_string
	mov si, newline
	call print_string

	jmp $				; Jump here; infinite loop.

	; Welcome message for operating system
	msg_string db 'Welcome to Pepinot 86...', 0 
	newline db 0x0D, 0x0A, 0

;
; Routine: get_date
; Return the [dd/mm/yyyy] system date in ASCII format.
; ch = century, cl = year, dh = month, dl = day.
get_date:
	call get_day		; Get ASCII day (dd).
	
;
; Routine: get_day
; Return the system day in ASCII format.
; dl = day.
get_day:
	mov ah, 0x04		
	int 0x1A	
	mov bh, dl
	mov ecx, 4
	dayloop:
	shr bh, 1			; Shift right 4x
	loop dayloop
	add bh, 0x30		; Add 30h to convert to ASCII
	mov [dateformat], bh
	mov bh, dl
	and bh, 0x0F;
	add bh, 0x30
	mov [dateformat + 1], bh
	ret		

dateformat db '00/00/0000', 0		

;
; Routine: print_string 
; Output string in SI to screen.
print_string:
	mov ah, 0x0E		
						
.repeat:
	lodsb						; Get character from string.
	cmp al, 0
	je .done					; If char is zero, end of string.
	int 0x10					; Otherwise, print it. (10h is the BIOS interrupt for print).
	jmp .repeat

.done:
	ret

	times 510 - ($-$$) db 0		; Pad remainder of boot sector with 0s
	dw 0xAA55					; The standard PC boot signature.
