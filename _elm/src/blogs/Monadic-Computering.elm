import Window
import Website.Blog.Skeleton as Blog
import Signal exposing (constant, map3)
import Markdown exposing (toElement)
import Graphics.Element exposing (Element, left)

post : Element
post = toElement """
Monads, or as you know them: *What the hell, who let the god damned Math Major 
back into the codebase again?*  Like it or not, they're here to stay -my
eternal thanks to [Professor Wadler](https://www.youtube.com/watch?v=5TMojC0Nb6A).

While you're here you may as well quit yer bellyachin' and figure out why they're
useful [besides confusing your enemies] computationally.  For that, we need to
understand why Professor Lambda Shirt decided to introduce them to the Haskell
community in the first place.

## Each Monad Embodies a Particular Computation Strategy

Welp, that was easy.

## Examples?

But of course!  I'm going to skip the nitty gritty and get on with it.  I, and
many others, have written, talked, lampooned, and various other synonyms for 
proselytized about what a Monad is.  If you need a refresher, pick an avenue
and start walking!

We'll start easy: The Identity Monad.

```
struct Id<T> {
    let runId : T
}
```

From its definition,  you can already tell this thing seems pretty useless, and
that's the point!  The Identity Monad embodies a computation that does *nothing*
to inputs it's given.  Here's what that looks like in C:

```
int main(int argc, char **argv, char **envp, char **APPLE) {
    return 1;
}
```

Now the familiar: The Maybe Monad (heretofore referred to as Optional<T>).  It
is the embodiement of a computation that may fail to produce a value (hence the
`.None` constructor.  When such computations are sequenced together any values
produced are carried along with them, but a single failing `.None` will bring
the whole process to a halt.  Think about them as the exceptions you always
wanted but could never have because language designers.

```
enum Optional<T> {
    case .Some(T)
    case .None
}
```

Breaking away: The Either Monad (we get to call it that because you can
partially apply the type constructor Either<T, U> as just Either<T, _> and
satisfy the kind requirement for Monad) embodies a computation that can branch.
Because of that kind restriction I brought up earlier, Haskellers have taken to
using the `Left` branch for \"failure\" and the right branch for \"value\", but
the distinction is entirely arbitrary.  `Either` is analogous to an if-else
statement.  By sequencing them, you get a computation that functions
exactly like if-else if-...else statements.

```
enum Either<L, R> {
    case Left(L)
    case Right(R)
}
```

Continuing the trend: The List Monad (hereafter, Array<T>) is a fascinating example
of an almost universal Monad whose computational embodiement is relatively obscure.
An Array of values represents a series of unevaluated paths in a branching
computation.  That is why map and filter are said to *realize* lists in lazy 
languages.  You're literally applying a function to each branch in the computation
tree, and also how the [coolest god-damned piece of Haskell ever
works](http://evan-tech.livejournal.com/220036.html).  By way of analogy, a list 
functions much like a `switch` statement:

```
switch x {
    case 1812:
        return \"*BOOM*, and other cannon noises.\"
    case 90125:
        return \"Leave It\"
    case 10538:
        return \"Did you hear the news?\" 
}
```

More to the point: Laziness is a Monad!  At least, delaying the production of a value can
be represented in much the same way as the Identity Monad.  As an optimization, most
authors (myself included) choose to implement the Memoizing Laziness Monad:

```
private enum LazyState<A> {
    case Eventually(() -> A)
    case Now(A)
}

public struct Lazy<A> {
    let state : STRef<(), LazyState<A>>
}
```

A statement of fact now: The State Monad is the realization of a computation that threads
a variable through each part (the state) and produces a value at the end, one that possibly
depends on that state value.  In a way, they're scoped versions of regular old variables.
That is, every pure function that declares variables can be lifted into a State Monad by
tuple-ing them all up in the state parameter.

Let's get funky: The Stream Monad (a list without end or bound) represents looping (more
like recursion, but whatever) infinitely.  It is a computation whose tree-structure contains
an infinite amount of possible branches; to evaluate it is suicide.

OK, now I'm lost: For my final trick, a shocker [for some]: An arrow is a Monad.  That's
right, the awkward little `->` we've all had to get used to typing in Swift is itself a
little [Plankalkül](https://en.wikipedia.org/wiki/Plankalkül), but we have to remember
the kind constraints on Monad first.  By partially applying `->` with an environment 
`((->) a)` of values, you get the Reader Monad, an embodiement of a computation that
looks up values to produce a result.  You can think of this one as a subscript.

One more thing: Reader has a dual called (duh) Writer.  Instead of values being pumped
out of a context, values are pumped *into* one: Subscripting + assignment.
"""

main = map3 Blog.generatePost Window.dimensions (constant "Paragons Of Perfunctory Programs") (constant post)

