data		dcd		3,6,4,1,8,2,7,9,5
		movs		r12, #0x00
		movs		r9, #0x04
		movs		r5,#0x24
		movs		r6,#0x00  ; Initialize r6 to 0
		
loop0	cmp		r12,#0x20
		beq		stop
		movs		r0, #0x100
		ldr		r1, [r0, r12] ; min = arr[r12]
		add		r3,    r0,r12
		add		r8,r12,#0x04
		
loop1	cmp		r9,r5
		beq		swap
		ldr		r2,[r0,r8]
		
		add		r6,r6,#0x04
		cmp		r1, r2
		bpl		swapmin ; if r1-r2 = positive
		
		add		r9,r9,#0x04	;		Increment r6 to maintain the address of min number
		add		r8,r8,#0x04
		bl		loop1
		
swapmin	mov		r1, r2 ; r1 = r2
		add		r9,r9,#0x04
		add		r8,r8,#0x04
		add		r3,r3,r6
		mov		r6,#0x00
		bl		loop1 ; If not equal, continue looping
		
swap		add		r4, r0, r12     ; Calculate the address of the first element
		ldr		r10, [r4]       ; Load the value at address [r0 + r12] into r10
		mov		r11, r1       ; Load the value at address [r1] into r11
		str		r10, [r3]       ; Store the value in r10 into the memory location pointed to by r1
		str		r11, [r4]       ; Store the value in r11 into the memory location pointed to by r3
		add		r12,r12,#0x04
		mov		r9,#0x04
		mov		r8,#0x00
		sub		r5,r5,#0x04
		MOV		R6,#0X00
		bl		loop0
		
		
stop		end
