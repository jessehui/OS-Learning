# OS Study Notes
> Orange's 一个操作系统的实现 阅读笔记

### 1. NASM
什么是NASM?  
NASM是一个为可移植性与模块化而设计的一个80x86的汇编器。它支持相当多
的目标文件格式，包括Linux和'NetBSD/FreeBSD','a.out','ELF','COFF',微软16
位的'OBJ'和'Win32'。它还可以输出纯二进制文件。它的语法设计得相当的简
洁易懂，和Intel语法相似但更简单。它支持'Pentium','P6','MMX','3DNow!',
'SSE' and 'SSE2'指令集. 

### 2. 汇编指令ORG
ORG是Origin的缩写：起始地址，源。在汇编语言源程序的开始通常都用一条ORG伪指令来实现规定程序的起始地址。如果不用ORG规定则汇编得到的目标程序将从0000H开始。例如：
```Assembly
 　　      ORG 2000H 　　
    START：MOV  AX，#00H
```
汇编语言源程序中若没有ORG伪指令，则程序执行时，指令代码被放到自由内存空间的CS:0处；若有ORG伪指令，编译器则把其后的指令代码放到ORG伪指令指定的偏移地址。两个ORG伪指令之间，除了指令代码，若有自由空间，则用0填充。

### 3. JMP $
$，代表当前地址。
$ 放在 LJMP 之后，它就代表这条指令本身的地址。
JMP $，就是转移到该指令的本身地址。
JMP $，就是原地转移的意思，即 死循环。
一旦有中断发生，就可以去执行中断程序。
