
	org 	07c00h;		告诉编译器 程序加载到内存07c00处
	mov 	ax, cs;		把cs的值放到ax寄存器中
	mov 	ds, ax;
	mov 	es, ax;
	call	DispStr;	调用显示字符串例程
	jmp	$;		无限循环

DispStr: 
	mov 	ax, BootMessage
	mov	bp, ax;		ES:BP = 串地址
	mov 	cx, 16;		cx = 串长度
	mov  	ax, 01301h;	ah = 13h; al = 01h;
	mov 	bx, 000ch;	页号为0(BH = 00h);黑底红字(BL = 0ch, 高亮)
	mov	dl, 0;
	int 	10h;		10h号中断
	ret
BootMessage: 	db	"Hello, OS World!"
times	510-($-$$)	db 	0;	填充剩下的空间, 使生成的二进制代码恰好为512个字节. 最后两个字节存放结束码0xaa55.
dw	0xaa55;		结束标志, 
