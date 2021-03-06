* ********************************************************************
* Do not touch the following 2 xdef lists:
* ********************************************************************
        xdef Start, Stop, End
        xdef A, B, GCD

* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
* You can add more xdef here to export labels to emacsim
* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	xdef X
	xdef WhileEnd, IfEnd

* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
*      Put your assembler program here - between the start and stop label
*      DO NOT define any variables here - see the variable section below
* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Start:
	move.l A,D0
	move.l B,D1
	cmp.l D1,D0
	BGE IfEnd
	move.l A,X
	move.l B,A
	move.l X,B

IfEnd: 
	move.l A,D0
	move.l B,D1
	divs D1,D0
	swap D0
	ext.l D0
	move.l D0,X

*** While loop comparison starts here
*** IfEnd is used as the last line of while loop
*** hence the branch to IfEnd! Efficiency!

	move.l X,D0
	cmp.l #0,D0
	BEQ WhileEnd
	move.l B,A
	move.l X,B
	BRA IfEnd


WhileEnd:
	move.l B,GCD

* ********************************************************************
* Don't touch the stop label - you need it to stop the program
* ********************************************************************
Stop:   nop



* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
*    Variable Section -   Put your variables here IF you need more
*
*    DO NOT define A, B and GCD !!!
*    They are already defined below
*
* You can add more variables below this line if you need them
* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
X:	ds.l 1

* ********************************************************************
* XXXX Don't touch anything below this line !!!
* ********************************************************************
A:      dc.l  168
B:      dc.l  651
GCD:    ds.l  1

End:    nop
        end
