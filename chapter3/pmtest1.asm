%include 	"pm.inc"		;//常亮,宏即一些说明

org 	07c00h;
	jmp LABEL_BEGIN


[SECTION .gdt]
;GDT 

;			段基址		 ,	段界限	 ,	属性	 ;
LABEL_GDT:		Descriptor	0,		0,		0;空描述符
LABEL_DESC_CODE32:	Descriptor	0, SegCode32Len-1,  DA_C + DA_32 ;非一致代码段
LABEL_DESC_VIDEO:	Descriptor 0B8000h,	0ffffh	 , 	DA_DRW   ;显存首地址

;GDT END



GdtLen		equ	$ - LABEL_GDT	;GDT长度
GdtPtr		dw   	GdtLen - 1;	GDT界限
		dd 	0;		GDT基地址


;GDT选择子
SelectorCode32 	equ	LABEL_DESC_CODE32	-LABEL_GDT
SelectorVideo	equ	LABEL_DESC_VIDEO	-LABEL_GDT

;End [SECTION .gdt]



[SECTION .s16]
[BITS	16]				;指明了它是一个16位代码段
LABEL_BEGIN:
	mov	ax, cs
	mov 	ds, ax
	mov 	es, ax
	mov 	ss, ax
	mov	sp, 0100h
















