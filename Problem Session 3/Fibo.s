main:
   PUSH %BP @นำค่าที่อยู่ใน Register BP มาใส่ใน Stack
   MOV  %SP, %BP @กำหนดค่า Register BP เป็นค่าปัจจุบันของ Stack Pointer
@main_body:
   SUB  %SP, $4, %SP @ปรับค่า stack pointer ทีละ 4 บิต
   MOV  $1, -4(%BP) @ ใส่ค่า 1 ไปที่ตำแหน่ง -4 ของ Base Pointer
   SUB  %SP, $4, %SP @ปรับค่า stack pointer ทีละ 4 บิต
   MOV  $1, -8(%BP) @ ใส่ค่า 1 ไปที่ตำแหน่ง -4 ของ Base Pointer
   SUB  %SP, $4, %SP @ปรับค่า stack pointer ทีละ 4 บิต
   MOV  $2, -12(%BP) @ ใส่ค่า 2 ไปที่ตำแหน่ง -4 ของ Base Pointer
   SUB  %SP, $4, %SP @ปรับค่า stack pointer ทีละ 4 บิต
   MOV  $44, -16(%BP) @ ใส่ค่า 44 ไปที่ตำแหน่ง -4 ของ Base Pointer
   SUB  %SP, $4, %SP @ปรับค่า stack pointer ทีละ 4 บิต
@while0:
   CMP  -12(%BP), -16(%BP) @ เทียบค่าที่ตำแหน่ง -12, -16 
   JGE  @false0 @ไปที่ @false0 ถ้าผลลัพธ์ของการเปรียบเทียบเป็น >=
@true0:
@if1:
   DIV  -12(%BP), $2, %0 @ หารค่าที่อยู่ในตำแหน่ง -12 ของ Base Pointer ด้วย 2 แล้วเก็บไว้ที่ตำแหน่งที่ 0
   CMP  %12, $0 @ เทียบค่าที่ตำแหน่ง -12 กับค่า 0
   JNE  @false1 @ไปที่ @false1 ถ้าผลลัพธ์ของการเปรียบเทียบเป็น !=
@true1:
   ADD  -4(%BP), -8(%BP), %0 @ นำค่าที่ตำแหน่ง -4,-8 ใน base Pointer มารวมกันแล้วเก็บไว้ที่ตำแหน่ง 0
   MOV  %0, -4(%BP) @ นำค่าที่ตำแหน่ง 0 มาเก็บไว้ที่ตำแหน่ง -4 ใน base Pointer 
   MOV  -4(%BP), -20(%BP) @ นำค่าที่ตำแหน่ง -4 ใน base Pointerมาเก็บไว้ที่ตำแหน่ง -20 ใน base Pointer 
   JMP  @exit1 @ไปที่ @exit1
@false1:
@if2:
   DIV  -12(%BP), $2, %0 @ หารค่าที่อยู่ในตำแหน่ง -12 ของ Base Pointer ด้วย 2 แล้วเก็บไว้ที่ตำแหน่งที่ 0
   CMP  %12, $1 @ เทียบค่าที่ตำแหน่ง -12 กับค่า 1
   JNE  @false2 @ไปที่ @false2 ถ้าผลลัพธ์ของการเปรียบเทียบเป็น !=
@true2:
   ADD  -4(%BP), -8(%BP), %0 @ นำค่าที่ตำแหน่ง -4,-8 ใน base Pointer มารวมกันแล้วเก็บไว้ที่ตำแหน่ง 0
   MOV  %0, -8(%BP) @ นำค่าที่ตำแหน่ง 0 มาเก็บไว้ที่ตำแหน่ง -4 ใน base Pointer 
   MOV  -8(%BP), -20(%BP) @ นำค่าที่ตำแหน่ง -4 ใน base Pointerมาเก็บไว้ที่ตำแหน่ง -20 ใน base Pointer 
   JMP  @exit2 @ไปที่ @exit2
@false2:
@exit2:
@exit1:
   INC  -12(%BP) @เพิ่มค่าที่อยู่ที่ตำแหน่งที่ -12 ของ Base Pointer ทีละ 1
   JMP  @while0  @ไปที่ @while0
@false0:
@exit0:
@main_exit:
   MOV  %BP, %SP @กำหนดค่า Register SP เป็นค่าปัจจุบันของ Register BP
   POP  %BP @นำค่าที่อยู่บน Stack มาใส่ใน Register BP
   RET @return