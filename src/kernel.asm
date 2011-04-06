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

	call print_welcome	; Print welcome and copyright message.

	call get_date		; Print system date.
	mov si, dateformat
	call print_string
	mov si, newline
	call print_string

	jmp $				; Jump here; infinite loop.

	; Welcome message and copyright notice for operating system
	msg_string db 'Welcome to Pepinot 86.', 0 
	copyright db 'Copyright (c) 2011 Sam Saint-Pettersen.', 0
	newline db 0x0D, 0x0A, 0
	dateformat db '00/00/0000', 0	
;	
; Routine: print_welcome.
; Print the welcome and copyright notice.
print_welcome
	mov si, newline
	call print_string
	mov si, msg_string
	call print_string
	mov si, newline
	call print_string
	mov si, copyright
	call print_string
	mov si, newline
	call print_string
	mov si, newline
	call print_string
	ret

;
; Routine: get_date in US date notation.
; Return the [mm/dd/yyyy] system date in ASCII format.
; [ch = century,] cl = year, dh = month, dl = day.
get_date:
	call get_month		; Get ASCII month (mm).
	call get_day		; Get ASCII day (dd).
	;call get_year		; Get ASCII year (yyyy).
	ret
	
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
	add bh, 0x30			; Add 30h to convert to ASCII
	mov [dateformat], bh
	mov bh, dl
	and bh, 0x0F;
	add bh, 0x30
	mov [dateformat + 4], bh
	ret

;
; Routine: get_month
; Return the system month in ASCII format.
; dh = month.
get_month:
	mov ah, 0x04		
	int 0x1A	
	mov bh, dh
	mov ecx, 4
	mthloop:
	shr bh, 1			; Shift right 4x
	loop mthloop
	add bh, 0x30			; Add 30h to convert to ASCII
	mov [dateformat], bh
	mov bh, dh
	and bh, 0x0F;
	add bh, 0x30
	mov [dateformat + 1], bh
	ret

;
; Routine: get_year
; Return the system year in ASCII format.
; cl = year.
get_year:
	mov ah, 0x04		
	int 0x1A	
	mov bh, cl
	mov ecx, 4
	yrloop:
	shr bh, 1			; Shift right 4x
	loop yrloop
	add bh, 0x30			; Add 30h to convert to ASCII
	mov [dateformat], bh
	mov bh, cl
	and bh, 0x0F;
	add bh, 0x30
	mov [dateformat + 9], bh
	ret	
	
;
; Routine: print_string 
; Output string in SI to screen.
print_string:
	mov ah, 0x0E		
						
.repeat:
	lodsb				; Get character from string.
	cmp al, 0
	je .done			; If char is zero, end of string.
	int 0x10			; Otherwise, print it. (10h is the BIOS interrupt for print).
	jmp .repeat

.done:
	ret

	times 510 - ($-$$) db 0		; Pad remainder of boot sector with 0s
	dw 0xAA55			; The standard PC boot signature.
