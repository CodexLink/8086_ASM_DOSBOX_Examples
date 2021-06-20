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

1. An IDE or Text Editor (I'm using, Visual Studio Code)
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

1. The first 2 is optional. The last 3 is required.
2. Keep in mind that, this is my way of launching my ASM programs, because, I mainly debug them and once they are okay. I'm gonna close it and call it a day.

## Filenames and Output

The following is a list of filenames along with it's description and their output. It will be long list, please check the [media folder]() for the overview of those picture. Or click the link per row to see the exact output.

| #  | Filename (.asm) 	| Require /T (*) | Description | Output |
|----| ----------------	| ----- | ------------- | ----------------- |
| 1  | ADD_NUM 		   	| Yes 	| (***Adding Numbers***) Adds 2 single-digit numbers and display them properly. (In-Equation Form) | ![Simulation Choices](https://github.com/CodexLink/Time-Based_Clap-Pattern-Lock_VHDL08/blob/LEGACY_WORK/imgs/overall-tests.png) |
| 2  | ATTRSCRL 	   	| No 	| (***Attribute Render with Scrolling**) Scroll then Render a 3-Column Color, Green-Red-Blue respectively. | ![Simulation Choices](https://github.com/CodexLink/Time-Based_Clap-Pattern-Lock_VHDL08/blob/LEGACY_WORK/imgs/overall-tests.png) |
| 3  | CHAR_POS 		| No 	| (***Character Positioning via Manipulation***) Get certain character index and move it somewhere from the string. | ![Simulation Choices](https://github.com/CodexLink/Time-Based_Clap-Pattern-Lock_VHDL08/blob/LGACY_WORK/imgs/overall-tests.png) |
| 4  | CMP_JMP 			| No 	| (***Compare then Jump!***) Compare and jump from one label to another based on input. | ![Simulation Choices](https://github.com/CodexLink/Time-Based_Clap-Pattern-Lock_VHDL08/blob/LGACY_WORK/imgs/overall-tests.png) |
| 5  | DSTROUT 			| No 	| (***Double String Output***) Displays a string from the input ***twice*** with delimiter handling via pointer. | ![Simulation Choices](https://github.com/CodexLink/Time-Based_Clap-Pattern-Lock_VHDL08/blob/LGACY_WORK/imgs/overall-tests.png) |
| 6  | GL_CB 			| No 	| (***Google Cardboard Logo***) A Logo Design of Google Cardboard in 8-bit Terminal. | ![Simulation Choices](https://github.com/CodexLink/Time-Based_Clap-Pattern-Lock_VHDL08/blob/LGACY_WORK/imgs/overall-tests.png) |
| 7  | GUESS_N 			| No 	| (***Guess the Number!***) Guess the number (5) with indicators of making the user input higher or lower. | ![Simulation Choices](https://github.com/CodexLink/Time-Based_Clap-Pattern-Lock_VHDL08/blob/LGACY_WORK/imgs/overall-tests.png) |
| 8  | LYMC 			| No 	| (***Light Blue-Yellow-Magenta-Cyan Column***) Renders 4-Column Colors with Identification String. | ![Simulation Choices](https://github.com/CodexLink/Time-Based_Clap-Pattern-Lock_VHDL08/blob/LGACY_WORK/imgs/overall-tests.png) |
| 9  | SH_USERN 		| No 	| (***Show Username after Input***) Show's username after asking for the name with delimiter modification. | ![Simulation Choices](https://github.com/CodexLink/Time-Based_Clap-Pattern-Lock_VHDL08/blob/LGACY_WORK/imgs/overall-tests.png) |
| 10 | SMP_ATTR 		| No 	| (***Sample of Screen Attribute Modification***) Shows a sample of blinking letters with background and foreground colors. | ![Simulation Choices](https://github.com/CodexLink/Time-Based_Clap-Pattern-Lock_VHDL08/blob/LGACY_WORK/imgs/overall-tests.png) |
| 11 | STCK_REC 		| No 	| (***Stacked Rectangles***) Just 3 rectangles, stacked together. Rendered in reverse. | ![Simulation Choices](https://github.com/CodexLink/Time-Based_Clap-Pattern-Lock_VHDL08/blob/LGACY_WORK/imgs/overall-tests.png) |
| 12 | STR_POS		 	| No 	| (***String Positioning***) Displays a string in the column-centric of the 80x80 terminal. | ![Simulation Choices](https://github.com/CodexLink/Time-Based_Clap-Pattern-Lock_VHDL08/blob/LGACY_WORK/imgs/overall-tests.png) |
| 13 | STRMANIP 		| No 	| (***String Manipulation***) Displays a string in reversed with extreme manipulation. | ![Simulation Choices](https://github.com/CodexLink/Time-Based_Clap-Pattern-Lock_VHDL08/blob/LGACY_WORK/imgs/overall-tests.png) |
| 14 | SUB_NUM			| Yes	| (***Subtract Numbers***) Subtracts 2 single-digit numbers with string output. (Non-Equation Output) | ![Simulation Choices](https://github.com/CodexLink/Time-Based_Clap-Pattern-Lock_VHDL08/blob/LGACY_WORK/imgs/overall-tests.png) |
| 15 | TRGB 			| No 	| T-Structure in Red and Green (Left) + Blue (Right) for Spacing. | ![Simulation Choices](https://github.com/CodexLink/Time-Based_Clap-Pattern-Lock_VHDL08/blob/LGACY_WORK/imgs/overall-tests.png) |
| 16 | TRIA 			| No 	| (***Half-Triangle***) Rendered with Bare-Minimum Loops. | ![Simulation Choices](https://github.com/CodexLink/Time-Based_Clap-Pattern-Lock_VHDL08/blob/LGACY_WORK/imgs/overall-tests.png) |

### Note(s)

1. The filenames are **8-letters long**. Anything more than 8 will make the **DOSBOX complain that it can't find it**.(2) asd
2. Most of the operations such as ***Adding*** and ***Subtracting*** a Number may require the use of ```/T``` when linking with ```TLINK.exe```. Please double check if ```TLINK``` is complaining about the stack being non-existent or otherwise.
3. With that being said, please try ```/T``` if the program won't run. The evaluation of needing ```/T``` is purely based from assumption without running them and carefully evaluating it.

## Why would I do this?

When there's a course that can't be taught professionally (in the means of **teaching them** with **further knowledge** about it), I would go initiate **self-learning mode** then proceed to ***ignore their teachings*** (they teach what's the basics and then proceed to have us learn the hard ropes because why not, it's a money grab anyway).

## Disclosure

Whenever you clone this repository and take action on any part of this material, you are putting yourself in a responsibility where you can't blame and risk someone else (like me) for getting yourself caught cheating or otherwise.

I only provide materials in a fashion where I want to distribute them because I used other resources. If these materials are the exact thing that shows in your deliverables, **please learn instead** of ***copying them*** straight up from someone else.

With the fact of typical students stealing, please if possible, **credit**. There would be no issues whenever you do it or now either way; just give some appreciation at least.

## Resources Used

The following links are a set of redirections to **certain PDFs** or **articles** that contain information on what you are doing. Keep in note that some of these links may also cover **DEBUGX** (*which I didn't dump because I don't have them saved locally, they were done in runtime and didn't intend to save them.*)
