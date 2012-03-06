5
aa b
ab bb
ab a
bb aa
aa bb
ab aa
a ba
ba b
bb ba
b bb
#END

Everything from the end on is ignored. This can be used as input for the program.

The first number at the beginning of the file is the limit of consecutive tiles to try.
          ex. a "3" at the beginning of the document will stop right before combination { 1,1,1,1}

This program will deal with as many dominos as typed.
Sides are separated by a space. Dominos are separated by new line.

Program assumes perfect input for now.


Files fulfilling assignment description

bookExample.txt   (a) example from Text

dominos.txt       (b)example I made up that is possible

hasNoSolution.txt (c) a third example that is obviously 

unknown.txt       (d) a fourth example that by appearances might be solvable, but is not solvable within the limits given.

readMe can be used as well but it's main purpose is to describe implemented version
of the PCP.rb solution to the PCP.