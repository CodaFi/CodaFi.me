import Window
import Website.Blog.Skeleton as Blog

post : Element
post = [markdown|
<p>
I have been writing Objective-C for the entirety of my (arguably short) programming career, and the only conclusion I can draw from all that time spent in the world of square-brackets and verbosity is that it forces me to think in extremely provincially about my code.  While the language itself is founded on very powerful ideas, and the libraries and tools provided by Apple’s walled garden are of an agreeable quality, there was always an urge within me to “peak out over the garden walls”, as it were, and experiment with other languages.  I’ve dabbled in the web, and left with a sour taste.  I’ve poked and prodded the list comprehension languages, forced the functional ones, and written self-reorganizing code in the ones promising to satisfy that code-as-data fetish for those of us so inclined that way.  But, paradoxically enough, the esoteric languages have, by far, been the most educational and satisfying.  To be fair, I’m not saying that you should run out and immediately install Malbolge on your computer -just to watch your precious RAM fill with garbage and have to program entirely in random, cryptographically-restructured, pointer arithmetic- but rather that it is those languages that seem most foreign that often have the most to offer.  It is in this spirit that I am going to discuss one of my great loves: INTERCAL.

> The names you are about to ignore are true. However, the story has been changed significantly. Any resemblance of the programming language portrayed here to other programming languages, living or dead, is purely coincidental.
>
> ~**INTERCAL-72 Language Specification, Introduction**

INTERCAL began one May morning as a joke between two residents of Princeton University, Donald R. Woods and James M. Lyon.  INTERCAL (affectionately expanded as the Compiler Language With No Pronounceable Acronym) was literally meant to be a compiler language that had nothing in common with any of the major languages of the period, eschewing everything but assignment statements, variables, arrays, and “IO”.  INTERCAL has no notion of pointers, strings, subroutines, boolean logic, and features a type system that’s little more than a sick joke wrapped in a cruel irony.  This strict adherence to a perverted definition of simplicity lead to a language innovative for its unconventional use of the ASCII character set, its nonsensical syntax, and its voluminous avenues for errors and confusion.  The INTERCAL-72 spec puts it best:

> It has few capabilities, and thus there are few restrictions to be kept in mind. Since it is an exceedingly easy language to learn, one might expect it would be a good language for initiating novice programmers. Perhaps surprising, than, is the fact that it would be more likely to initiate a novice into a search for another line of work.
>
> ~**INTERCAL-72 Language Specification, Section 2.2**

## Structure

```
ICL778I	UNEXPLAINED COMPILER BUG
	ON THE WAY TO 2
        CORRECT SOURCE AND RESUBNIT
```
> An error code from ICK, the INTERCAL compiler

INTERCAL is built around the notion of optionally-numbered ordered statements consisting of either an operator and its argument, or a DO-prefixed expression.  All statements that are not explicitly operators must be prepended with a `DO`.  But, as telling the compiler -called ICK - to `DO` your bidding is rude, every third-ish statement must be prepended with a `PLEASE DO`.  Failure to make at least 1/5th of all statements `PLEASE` statements will result in ICK rejecting your program as insufficiently polite.  Conversely, if more than 1/3rd of statements are prepended with a `PLEASE`, your program will be rejected as overly polite.  Thus, INTERCAL forces the programmer to contort their code so as not to trample on the Politesse Checking mechanism.

Line numbers must be explicitly reserved by the programmer or the library writer so as to avoid clashes with existing line numbers.  For example, the INTERCAL system libraries reside on line numbers 1000-1999, and any program making use of lines or labels in that range are subject to undefined behavior.  C-INTERCAL corrects this with the `-E` option, but this obstructs inclusion of the standard libraries).  Every line may be preceded by a double-oh-seven (%) and a number from 0-100 inclusive which indicates the probability a given line may be executed when it is reached, allowing some notion of randomness to any INTERCAL program.
</p>
|]

main = lift4 Blog.generateImagefulPost Window.dimensions (constant "Variations on a RoCocoa Theme") (constant "http://images03.olx.co.za/ui/19/87/99/1328006455_309297899_1-Intercal-Calibration-Services-CC-Newton-Park.jpg") (constant post)
