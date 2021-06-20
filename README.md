<h1 align="center">8086 ASM DOSBox Examples</h1>

<h4 align="center">A set of runnable 8086 ASM Programs, taken from the CPE 022 — Computer Architecture and Organization as Exercises and Activity (Deliverables).
<h4>

<div align="center">

[![8086 ASM DOSBox Repo License](https://img.shields.io/github/license/CodexLink/8086_ASM_DOSBOX_Examples?color=purple&label=Repository%20License&logo=libreoffice)](https://github.com/CodexLink/8086_ASM_DOSBOX_Examples/blob/main/LICENSE)

</div>

# Welcome

This repository contains all of my activities and exercises taken from one of my courses (see the names on the sub title above). It was **dumped** to ensure that further review from this field and scope is **reviewable** without problems.

***In short***, I want to dump my deliverables somewhere open so that other fellow students who take up this course can find learning materials (**not a cheating material!!!**) for them to learn. If you ever get doubt at learning at this, then try looking at this repository where each **.ASM** has its comments (my insights).

## Pre-requisites

The following list is a set of things you need to get up and running.

1. An IDE or Text Editor (I'm using Visual Studio Code)
2. DOSBox
3. TASM
4. TLINK

### Note

There's no indicator which version is better or optimal. Please follow the instructions of your professor.

## Running

Here's my snippet of what I have in my DOSBox Startup Configuration.

```text
MOUNT <ANY_DRIVE_LETTER> <FOLDER>
<ANY_DRIVE_LETTER>:

TASM <PROGRAM_NAME_WO_EXTENSION>
TLINK /T <PROGRAM_NAME_WO_EXTENSION>
<PROGRAM_NAME_WO_EXTENSION>
```

### Reminder

1. The **first 2 is optional**. The last **3 is required**.
2. It is pretty obvious that you should change the contents inside "<>" but without "<>" literally.
3. Keep in mind that, this is my way of launching my ASM programs, because, I mainly debug them and once they are okay. I'm gonna close it and call it a day.

## Filenames and Output

The following is a list of filenames along with it's description and their output. It will be long list, please check the [media folder](https://github.com/CodexLink/8086_ASM_DOSBOX_Examples/tree/main/media) for the overview of those picture. Or click the images per row to see the exact output.

| #  | Filename (.asm) 	| Require /T (*) | Description | Output |
|----| ----------------	| ----- | ------------- | ----------------- |
| 1  | ADD_NUM 		   	| Yes 	| (***Adding Numbers***) Adds 2 single-digit numbers and display them properly. (In-Equation Form) | ![ADD_NUM Output](https://github.com/CodexLink/8086_ASM_DOSBOX_Examples/blob/main/media/ADD_NUM.png) |
| 2  | ATTRSCRL 	   	| No 	| (***Attribute Render with Scrolling**) Scroll then Render a 3-Column Color, Green-Red-Blue respectively. | ![ATTRSCRL Output](https://github.com/CodexLink/8086_ASM_DOSBOX_Examples/blob/main/media/ATTRSCRL.png) |
| 3  | CHAR_POS 		| No 	| (***Character Positioning via Manipulation***) Get certain character index and move it somewhere from the string. | ![CHAR_POS Output](https://github.com/CodexLink/8086_ASM_DOSBOX_Examples/blob/main/media/CHAR_POS.png) |
| 4  | CMP_JMP 			| No 	| (***Compare then Jump!***) Compare and jump from one label to another based on input. | ![CMP_JMP Output](https://github.com/CodexLink/8086_ASM_DOSBOX_Examples/blob/main/media/CMP_JMP.png) |
| 5  | DSTROUT 			| No 	| (***Double String Output***) Displays a string from the input ***twice*** with delimiter handling via pointer. | ![DSTROUT Output](https://github.com/CodexLink/8086_ASM_DOSBOX_Examples/blob/main/media/DSTROUT.png) |
| 6  | GL_CB 			| No 	| (***Google Cardboard Logo***) A Logo Design of Google Cardboard in 8-bit Terminal. | ![GL_CB Output](https://github.com/CodexLink/8086_ASM_DOSBOX_Examples/blob/main/media/GL_CB.png) |
| 7  | GUESS_N 			| No 	| (***Guess the Number!***) Guess the number (5) with indicators of making the user input higher or lower. | ![GUESS_N Output](https://github.com/CodexLink/8086_ASM_DOSBOX_Examples/blob/main/media/GUESS_N.png) |
| 8  | LYMC 			| No 	| (***Light Blue-Yellow-Magenta-Cyan Column***) Renders 4-Column Colors with Identification String. | ![LYMC Output](https://github.com/CodexLink/8086_ASM_DOSBOX_Examples/blob/main/media/LYMC.png) |
| 9  | SH_USERN 		| No 	| (***Show Username after Input***) Show's username after asking for the name with delimiter modification. | ![SH_USERN Output](https://github.com/CodexLink/8086_ASM_DOSBOX_Examples/blob/main/media/SH_USERN.png) |
| 10 | SMP_ATTR 		| No 	| (***Sample of Screen Attribute Modification***) Shows a sample of blinking letters with background and foreground colors. | ![SMP_ATTR Output](https://github.com/CodexLink/8086_ASM_DOSBOX_Examples/blob/main/media/SMP_ATTR.gif) |
| 11 | STCK_REC 		| No 	| (***Stacked Rectangles***) Just 3 rectangles, stacked together. Rendered in reverse. | ![STCK_REC Output](https://github.com/CodexLink/8086_ASM_DOSBOX_Examples/blob/main/media/STCK_REC.png) |
| 12 | STR_POS		 	| No 	| (***String Positioning***) Displays a string in the column-centric of the 80x80 terminal. | ![STR_POS Output](https://github.com/CodexLink/8086_ASM_DOSBOX_Examples/blob/main/media/STR_POS.png) |
| 13 | STRMANIP 		| No 	| (***String Manipulation***) Displays a string in reversed with extreme manipulation. | ![STRMANIP Output](https://github.com/CodexLink/8086_ASM_DOSBOX_Examples/blob/main/media/STRMANIP.png) |
| 14 | SUB_NUM			| Yes	| (***Subtract Numbers***) Subtracts 2 single-digit numbers with string output. (Non-Equation Output) | ![SUB_NUM Output](https://github.com/CodexLink/8086_ASM_DOSBOX_Examples/blob/main/media/SUB_NUM.png) |
| 15 | TRGB 			| No 	| T-Structure in Red and Green (Left) + Blue (Right) for Spacing. | ![TRGB Output](https://github.com/CodexLink/8086_ASM_DOSBOX_Examples/blob/main/media/TRGB.png) |
| 16 | TRIA 			| No 	| (***Half-Triangle***) Rendered with Bare-Minimum Loops. | ![TRIA Output](https://github.com/CodexLink/8086_ASM_DOSBOX_Examples/blob/main/media/TRIA.png) |

### Note(s)

1. The filenames are **8-letters long**. Anything more than 8 will make the **DOSBOX complain that it can't find it**.(2) asd
2. Most of the operations such as ***Adding*** and ***Subtracting*** a Number may require the use of ```/T``` when linking with ```TLINK.exe```. Please double check if ```TLINK``` is complaining about the stack being non-existent or otherwise.
3. With that being said, please try ```/T``` if the program won't run. The evaluation of needing ```/T``` is purely based from assumption without running them and carefully evaluating it.
4. There are atleast **1-2 activities** that didn't make it to the open-source. This is because those activities are: (a) too basic, (b) potentially renders someone unable to learn. and, (c) too complex to be provided and taken away. I have this one activity that has the capacity to drain my **dignity for about 12 hours**, I'll never forget that.

## Why would I do this?

When there's a course that can't be taught professionally (in the means of **teaching them** with **further knowledge** about it), I would go initiate **self-learning mode** then proceed to ***ignore their teachings*** (they teach what's the basics and then proceed to have us learn the hard ropes because why not, it's a money grab anyway).

## Disclosure

Whenever you clone this repository and take action on any part of this material, you are putting yourself in a responsibility where you can't blame and risk someone else (like me) for getting yourself caught cheating or otherwise.

I only provide materials in a fashion where I want to distribute them because I used other resources. If these materials are the exact thing that shows in your deliverables, **please learn instead** of ***copying them*** straight up from someone else.

With the fact of typical students stealing, please if possible, **credit**. There would be no issues whenever you do it or now either way; just give some appreciation at least.

## Resources Used

The following links are a set of redirections to **certain PDFs** or **articles** that contain information on what you are doing. Keep in note that some of these links may also cover **DEBUGX** (*which I didn't dump because I don't have them saved locally, they were done in runtime and didn't intend to save them.*)

1. **Some TASM Instruction Set Info**: <http://www.husseinsspace.com/teaching/udw/1996/asmnotes/chaptwo.htm>
2. **Service Interrupts Sys Calls**: <http://spike.scu.edu.au/~barry/interrupts.html>
3. **Some Intro to Assembly**: <https://www.tutorialspoint.com/assembly_programming/assembly_tutorial.pdf>
4. **Regarding About 4C00H Termination**: <https://www.quora.com/MOV-AX-4C00H-what-does-this-instruction-mean-in-a-microprocessor>
5. **Flag Registers in 8085 and 8086**: <https://www.geeksforgeeks.org/flag-register-8085-microprocessor/> | <https://www.geeksforgeeks.org/flag-register-8086-microprocessor/>
6. **Arithmetic Flags and Instruction**: <https://service.scs.carleton.ca/sivarama/asm_book_web/Student_copies/ch6_arithmetic.pdf> | <http://www.ee.nmt.edu/~rison/ee308_spr02/supp/020123.pdf>
7. **Assembly Registers:** <https://www.tutorialspoint.com/assembly_programming/assembly_registers.htm> | <https://www.csie.ntu.edu.tw/~acpang/course/asm_2004/slides/chapt_07_PartIISolve.pdf> |  <https://www.tutorialspoint.com/assembly_programming/assembly_arithmetic_instructions.htm>
8. **Registers and Executions**: <http://www.godevtool.com/GoasmHelp/newass.htm>
9. **DEBUG Instructions**: <https://www.slideshare.net/defrimnc/debug-tutorial> | <https://montcs.bloomu.edu/Information/LowLevel/DOS-Debug.html>
10. **ASM 8086 Cheatsheet**: <https://cheatography.com/mika56/cheat-sheets/asm-8086/>
11. **About Brackets as Dereference of Address**: <https://stackoverflow.com/questions/2030366/what-do-the-brackets-mean-in-x86-asm> | <https://stackoverflow.com/questions/39474332/assembly-difference-between-var-and-var> | **Exactly**: <https://stackoverflow.com/a/39474679/5353223>
12. **About DUP for Custom Declaration of Bytes of Space, Page 15**: <https://www2.southeastern.edu/Academics/Faculty/kyang/2009/Fall/CMPS293&290/ClassNotes/CMPS293&290ClassNotesChap03.pdf>
13. **Understanding the use of "MOV AX, 0B800H"**: <https://www.tek-tips.com/viewthread.cfm?qid=614518>
14. **Understanding the use of "ORG 100H"**: <https://stackoverflow.com/questions/13321808/how-does-assembler-process-org-100h-directive>
15. **What is @data in ASM (cont.)**: <https://stackoverflow.com/questions/4928538/what-does-the-data-directive-mean-in-masm> | **Proof**: <https://stackoverflow.com/questions/5330306/when-will-the-code-under-data-segment-execute-in-this-code> | **Work:** <https://stackoverflow.com/a/47002757/5353223>
16. **Entering String Snippet**: <https://stackoverflow.com/a/29517960/5353223>
17. **Looping Introduction**: <https://stackoverflow.com/a/10358699/5353223>
18. **Supported Interrupts by Emulators in 8086 Architecture**: <https://www.gabrielececchetti.it/Teaching/CalcolatoriElettronici/Docs/i8086_and_DOS_interrupts.pdf>

## Credits

I would like to **thank all** of the authors that has a question that exists in the internet, people who provides pdfs and articles without shutting their servers down, extensions who extend the capabilities of my text editor, providers of **TASM**, **DEBUGX** and **TLINK** compiled programs, and other people who became the part of my self-learning experience of this course. Some links provided below are the once I can honorly mention because of my utilization to their programs / extensions / etc:

1. [Assembly 8086 (TASM) by Roncho](https://marketplace.visualstudio.com/items?itemName=Roncho.assembly-8086)
2. [Neovim](https://neovim.io/)
3. [Vim Extension by vscodevim](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim)
4. [DOSBox Emulator](https://www.dosbox.com/)
5. [Visual Studio Code](https://code.visualstudio.com/)

***Thank you for reaching this far. I appreciate you for taking an interest to my dumped contents.***
