import Window
import Website.Blog.Skeleton as Blog 
import Signal exposing (constant, map4) 
import Markdown exposing (..)
import Graphics.Element exposing (Element, left)

options : Options
options =
    { githubFlavored = Just { tables = True, breaks = False }
    , sanitize = False
    , smartypants = True
    }

post : Element
post = toElementWith options """
## Introduction

I have been writing Objective-C for the entirety of my (arguably short)
programming career, and the only conclusion I can draw from all that time spent
in the world of square-brackets and verbosity is that it forces me to think in
extremely provincially about my code.  While the language itself is founded on
very powerful ideas, and the libraries and tools provided by Apple’s walled
garden are of an agreeable quality, there was always an urge within me to \"peek
out over the garden walls\", as it were, and experiment with other languages.
I’ve dabbled in the web, and left with a sour taste.  I’ve poked and prodded the
list comprehension languages, forced the functional ones, and written
self-reorganizing code in the ones promising to satisfy that code-as-data fetish
for those of us so inclined that way.  But, paradoxically enough, the esoteric
languages have, by far, been the most educational and satisfying.  To be fair,
I’m not saying that you should run out and immediately install
[Malbolge](http://en.wikipedia.org/wiki/Malbolge) on your computer -just to
watch your precious RAM fill with garbage and have to program entirely in
random, cryptographically-restructured, pointer arithmetic- but rather that it
is those languages that seem most foreign that often have the most to offer.  It
is in this spirit that I am going to discuss one of my great loves: INTERCAL.

> The names you are about to ignore are true. However, the story has been
> changed significantly. Any resemblance of the programming language portrayed
> here to other programming languages, living or dead, is purely coincidental.
> - INTERCAL-72 Language Specification, Introduction

INTERCAL began one May morning as a joke between two residents of Princeton
University, Donald R. Woods and James M. Lyon.  INTERCAL (affectionately
expanded as the Compiler Language With No Pronounceable Acronym) was literally
meant to be a compiler language that had nothing in common with any of the major
languages of the period, eschewing everything but assignment statements,
variables, arrays, and “IO”.  INTERCAL has no notion of pointers, strings,
subroutines, boolean logic, and features a type system that’s little more than
a sick joke wrapped in a cruel irony.  This strict adherence to a perverted
definition of simplicity lead to a language innovative for its unconventional
use of the ASCII character set, its nonsensical syntax, and its voluminous
avenues for errors and confusion.  The INTERCAL-72 spec puts it best:

> It has few capabilities, and thus there are few restrictions to be kept in
> mind. Since it is an exceedingly easy language to learn, one might expect it
> would be a good language for initiating novice programmers. Perhaps surprising,
> than, is the fact that it would be more likely to initiate a novice into
> a search for another line of work.
> - INTERCAL-72 Language Specification, Section 2.2

## Character Set

INTERCAL's unique use of the ASCII character set means that the creators of the
language had ample opportunity to rename certain obscure characters.  This being
INTERCAL, they also took the opportunity to rename several more common
characters.  Going forward, any characters mentioned specific to the language
will be written in their INTERCAL-72 form, which is as follows (taken from the
[Tonsil](http://www.muppetlabs.com/~breadbox/intercal-man/tonsila.html)):

| Column 1 | Column2     | Column 3 |
| -------- | ----------- | -------- |
| text     | `some|code` | text     |


| Character | Name | Use (if any) |
| --------- | ---- | ------------ |
| . | spot  | identify 16-bit variable
| : | two-spot | identify 32-bit variable

```
,                tail                            identify 16-bit array
;                hybrid                          identify 32-bit array
#                mesh                            identify constant
=                half-mesh
'                spark                           grouper
`                backspark
!                wow                             equivalent to spark-spot
?                what                            unary XOR
\"                rabbit-ears                     grouper
\".               rabbit                          equivalent to ears-spot
|                spike
%                double-oh-seven                 percentage qualifier
-                worm                            used with angles
<                angle                           used with worms
>                right angle
(                wax                             precedes line label
)                wane                            follows line label
[                U turn
]                U turn back
{                embrace
}                bracelet
&                ampersand *                     unary AND
V                V (or book)                     unary OR
$                big money                       binary interleave
¢                change                          binary interleave
~                sqiggle                         binary select
_                flat worm
¯                overline                        indicates \"times 1000\"
+                intersection                    separates list items
/                slat
\\               backslat
¬                hookworm
```

## Structure

```
    ICL778I UNEXPLAINED COMPILER BUG
    ON THE WAY TO 2
        CORRECT SOURCE AND RESUBNIT
```
> An error code from ICK, the INTERCAL compiler

INTERCAL is built around the notion of optionally-numbered ordered statements
consisting of either an operator and its argument, or a DO-prefixed expression.
All statements that are not explicitly operators must be prepended with a `DO`.
But, as telling the compiler -called ICK - to `DO` your bidding is rude, every
third-ish statement must be prepended with a `PLEASE DO`.  Failure to make at
least 1/5th of all statements `PLEASE` statements will result in ICK rejecting
your program as insufficiently polite.  Conversely, if more than 1/3rd of
statements are prepended with a `PLEASE`, your program will be rejected as
overly polite.  Thus, INTERCAL forces the programmer to contort their code so as
not to trample on the Politesse Checking mechanism.  Anything that does not
compile is a comment, often leading to statements such as `PLEASE DONT` or
`DONT` being used as common comment delimiters.  Care must be exercised when
writing comments, as any occurence of `N'T` and `NOT` at the start of a program
are abstensions from the previous operators.  This will become clear in later
sections.

Line numbers must be explicitly reserved by the programmer or the library writer
so as to avoid clashes with existing line numbers.  For example, the INTERCAL
system libraries reside on line numbers 1000-1999, and any program making use of
lines or labels in that range are subject to undefined behavior.  C-INTERCAL
corrects this with the `-E` option, but this obstructs inclusion of the standard
libraries).  Every line may be preceded by a double-oh-seven (%) and a number
from 0-100 inclusive which indicates the probability a given line may be
executed when it is reached, allowing some notion of randomness to any INTERCAL
program.

Variables must be of type spot, two-spot, tail, or hybrid, and may only be named
numerically.  All INTERCAL variables are miniature stacks that can be pushed to
with the `STASH` command, and popped off with the `RETRIEVE` command.
Attempting to `RETRIEVE` variables that have not been `STASH`'ed to results in
the runtime error message `THROW STICK BEFORE RETRIEVING`.  Variables may also
be `IGNORE`'d, that is made immune to the effects of any subsequent statements
except the `REMEMBER` command, which annuls the effects of an `IGNORE`.
Assignment is acchieved through the use of the `<-` operator (pronounced
calculate).  For example, to declare a 16-bit integer `:1` containing the value
16, then terminating, the following program could be written:

```
DO :1 <- #16
DO GIVE UP
```

## Operators

INTERCAL-72 includes 5 operators, of which 2 are binary and 3 are unary.  While
these operators may share names with many common operators in other languages,
they have literally nothing in common with them, and often perform unnecessarily
complex mathematical operations on the bits of a variable to arrive at an
answer.  The binary operators are mingle, represented by big-money ($) and
select, represented by a worm (~).  Mingle takes the bits of two numbers,
interleaves them, then returns the result with any overflow than doesn't fit
into the type of the second variable being lopped off, or causing a runtime
error (whichever the compiler finds most convenient).  It's always best to
visualize this operator, so here is 22 being mingled with 8:

```
DO .1 <- #22$#8
DO GIVE UP

0 0 0 1 0 1 1 0  // Bits of 22 with left-padding
 0 0 0 0 1 0 0 0 // Bits of 8 with left-padding
0000001001101000 // Bits are interleaved to yield 616
```

Select is far more complicated, and is said to be based on [Warmenhovian Logic
Gates](http://www.muppetlabs.com/~breadbox/intercal-man/figure1.html), an
extremely obscure offshoot of boolean algebra that often leads to New York, but
might lead to Philly if you do it right.  Select takes the bits of the first
number, left pads them, then takes the bits of the right number, aligns them,
and uses the 1's in the second variable to \"select\" bits from the first, then
left-padding the result.  Again, visualizing this operator is always much easier
than words:

```
DO .1 <- #22~#8
DO GIVE UP

0 0 0 1 0 1 1 0  // Bits of 22 with left-padding
0 0 0 1 1 0 0 0  // Bits of 24 with left-padding
_______________
0 0 0 0 0 0 1 0  // Bits are selected to yield 2
```

Brilliant.  This isn't so hard to deal with in practice, it's just quite a bit
more math than it should be.  Now for the Unary Operators:

INTERCAL's unary operators work in much the same way its binary operators do.
Bit manipulation is the name of the game when dealing with unary operators, and
INTERCAL cares so much about its unary operators that they may actually be used
in succession.  The only downside is the restrictions on where these operators
may be used:    after the type of a variable in its declarations.

The Ampersand (curiously, the only character that retains its proper name) goes
through each pair of bits in a number, `AND`s them together, the Book (V)
operator performs logical `OR`'ing of the bits of a number, and What (?)
performs logical XOR'ing of the bits of a number.

``` 
DO .1 <- #&100

0 1 1 0 0 1 0 0  // Bits of 100 with left-padding
0 0 1 0 0 0 0 0  // Bits are AND'ed together to yield 32

DO .12<- #V100

0 1 1 0 0 1 0 0  // Bits of 100 with left-padding
0 1 1 1 0 0 1 0  // Bits are OR'ed together to yield 114

DO .3 <- #?100

0 1 1 0 0 1 0 0  // Bits of 100 with left-padding
0 1 0 1 0 1 1 0  // Bits are XOR'ed together to yield 86

DO GIVE UP
```

## A Turing Tarpit

INTERCAL is the original Turing Tarpit language.  That is, it is a language that
is Turing complete through the most ridiculous or useless constructs.  Bearing
that in mind, INTERCAL's Turing-completeness stems from its `COME FROM` and
`NEXT` statements.  `COME FROM` is really `GOTO` implemented \"backwards in
time\", and thus can be used to insert certain statements after a line
is executed.  For example:

```
(1)     DO <any statement>
        .
        .
        .
(2)     DO COME FROM (1)
```

should be thought of as being equivalent to

```
(1)     DO <any statement>
(2)     DO GOTO (3)
        .
        .
        .
(3)     DO NOTHING
```

Of course, the 2nd part of the example above is flawed, in that GOTO is not an
operator in INTERCAL, and it will not compile.

The `NEXT` operator is used to implement the shadow of subroutines, and like
variables, maintains a stack of line labels that have been `NEXT`'ed to.  True
to form, INTERCAL only allows 79 line labels to be pushed onto the `NEXT` stack.
Attempting to `NEXT` an 80th statement results in the error message `PROGRAM HAS
DISAPPEARED INTO THE BLACK LAGOON` and immediate program termination.  This
means the programmer has to take great care to ensure that most `NEXT`'s are
balanced with a `FORGET`, which pops a variable number of statements off the
`NEXT`'ing stack and continues program execution.  It's easy to see how this
could be used to implement looping constructs, and even recursion if done
properly.

Any notion of conditional behavior must be accomlished with the `ABSTAIN` and
`REINSTATE` statements.  As the name implies, `ABSTAIN` causes a statement or
line label to not be executed, or have its effects nullified when it is
encoutered.  `REINSTATE` does the opposite.  It's important to note that
`ABSTAIN` and `REINSTATE` do not take simple statements are arguments, rather
they take gerund lists of statements.  Thus, to nullify the effects of the
calculate operator, the following is invalid:

```
PLEASE ABSTAIN FROM CALCULATE
```

Rather, its gerund should be used.

```
PLEASE ABSTAIN FROM CALCULATING
```

As noted by the spec:

> `DO ABSTAIN FROM ABSTAINING` is perfectly valid, as is `DO ABSTAIN FROM 
> REINSTATING` (although this latter is not usually recommended). However, the
> statement `DO ABSTAIN FROM GIVING UP` is not accepted, even though `DON'T GIVE
> UP` is.


## \"IO\"

The input side of IO is accomplished through the `WRITE IN` statement.  Rather
than restrict the types of the variables input will be written to, INTERCAL
severely restricts the languages and forms of any input.  Numbers to be read in
must be written out in all caps in english and the digits must be separated by
at least one space.  For example, the range of 32-bit numbers is `ZERO`, or `OH`
through `FOUR TWO NINE FOUR NINE SIX SEVEN TWO NINE FIVE`.  In an attempt to
appear more \"international\", INTERCAL also recognizes input in the following
languages: Sanskrit, Basque, Tagalog, Classical Nahuatl, Georgian, Kwakiutl, and
Volapuk.

> Attempting to write in a value greater than or equal to `SIX FIVE FIVE THREE
> SIX` for a 16-bit variable will result in the error message, `DON'T BYTE OFF
> MORE THAN YOU CAN CHEW`.
> - INTERCAL-72 Language Specification, Section 2.4.4.12

Output is acchieved through butchered Roman Numerals, which are as awful as the
name implies.  Overlines indicate that the value below is to be multiplied by
1000, and lowercase letters indicate the value should be multiplied by 1000000.
Zero is represented by just an overline.  Thus, the constant `#6,000` is written
out as:

```
__
VI
```

## It Gets So Very Much Worse

INTERCAL also comes in a dialect known as TriNTERCAL, or Trinary INTERCAL.
Whereas classical INTERCAL concerns itself with mangling binary operators,
TriNTERCAL deals with trits, or 3-bit values.  TriNTERCAL introduces two new
operators, whirlpool (@) and sharkfin (^), and overloads What (?) to be
substraction without borrowing.  Despite how complicated this all may sound, the
TriNTERCAL spec actually presents it excellently using the metaphor of \"choice\"
and \"preference\".  For example, binary `AND` is said to \"prefer returning 0, but
returning 1 given no other choice\", and binary OR is said to \"prefer returning
1, but returning 0 given no other choice.\" Trinary `OR` means given 0, 1, 2, the
operator prefers to return 2, then 0, and will return 1 given no other choice.
Trinary `AND` wants to return 0, will accept returning 1, and returns 2 given no
other choice.  The only operator left is whirlpool, or logical `BUT`, which the
spec puts best:

> In TriINTERCAL programs the whirlpool (@) denotes the unary tritwise BUT
> operation. You can think of the whirlpool as drawing values preferentially
> towards the central value 1. Alternatively, you can think of it as drawing your
> soul and your sanity inexorably down....
> - INTERCAL-72 Language Specification, Section 6.5.2.1

## Finding Value Among Garbage

If you've made it this far without either dying of laughter or gouging your
eyeballs out or considering Office-Space'ing your computer at the stupidity of
programming language jokes in the 70's, then there has to be a question as to
why languages like INTERCAL have any value aside from demonstration purposes.
INTERCAL is not a language I would ever want to program in for client work, nor
is a language that makes much in the way of useful work possible.  Where the
value of esolangs lies is in strengthening the logical aspects of my mind.
INTERCAL and others like it force me to think about my code far more
structurally than ever before, and logic must be inherent in the program itself
and not datatypes, interfaces, or collections.  By lowering the amount of
avenues and alternatives that I have to consider when trying to even get
a program \"running\" in one of these languages, they have the effect of focusing
my efforts rather than hindering them.

One final note: For the love of god, don't specify the optimizer option when
trying to compile INTERCAL.  The optimizer will run for hours or days at a time
attempting to \"optimize\" (ha!) your code.
"""

main = map4 Blog.generateImagefulPost Window.dimensions 
        (constant "Variations on a RoCocoa Theme") 
        (constant "http://images03.olx.co.za/ui/19/87/99/1328006455_309297899_1-Intercal-Calibration-Services-CC-Newton-Park.jpg") 
        (constant post)

