import Window
import Website.Blog.Skeleton as Blog
import Signal exposing (constant, map3)
import Markdown exposing (toElement)
import Graphics.Element exposing (Element, left)

post : Element
post = toElement """
## A (Haskell) Monad Is...

A monoid in the category of endofunctors...

Such that the following diagrams commute

## Mu Reduction

```
         μT
    T³ -----→ T²
    |         |
 Tμ |         | μ
    |         |
    ↓         ↓
    T² -----→ T
         μ
```

## Eta Introduction and Elmination

```
    ηT       Tη
Tx ---> T²x <--- Tx
   \\     |      /
     \\   | μ  /
       \\ |  /
         \\/
         Tx
```

## WTF

They're just an application of category theory.  When a mathematician says
something is *in* something else, they mean that all the laws that the thing on
the left obeys get shoved into the thing on the right, and it also gains some
neat other functions in the process.

## Monoids

A monoid is a Set of stuff (we'll call S for now), and a 2-ary operator `•`
(dot) that does composition of elements in S, and an `identity element` (called
`e`) which does nothing to the other operand of `•` when used.  For the natural
numbers, we can call `•`, \"+\" and `identity element`, \"0\", then go on to prove
things about addition.  In fact, what we can prove are precisely the monoid
laws.

```Haskell
-- e.g. the result of n+m if n : Nat and m : Nat is going to be a Nat as well.
-- n+m doesn't just randomly turn into a Real or Integer all of a sudden
Closure - a • a :: a
-- e.g. (n + m) + o = n + (m + o)
Associativity - (a • b) • c == a • (b • c)
-- (e.g. 0)
Identity - a • e = a
```

Haskell has a Monoid typeclass that follows the same laws.  Here she is in all her glory:

```Haskell
class Monoid a where
    -- The identity of the monoid
    mempty :: a
    -- "•"
    mappend :: a -> a -> a
    -- Monoidic fold (fold mappend over a container of elements of the Monoid)
    mconcat :: [a] -> a
```

Everything fits into place, and without one you can't have any of the others.

## Monards

Now, we do the same thing with monads.  But what is a monad?

We gave the rigorous definition above, and there's a million different crappy
analogies for what they are, so let's try to explore them mathematically.
A monad is an endofunctor (a mapping from one category C right back to itself)
and two natural transformations η (also called the Unit) and ν (also called the
Multiplication).

A distinction must be made between the unit *type* and our monad's unit
*function*.  The unit *type* is precisely what it sounds like: A type that
functions as our identity element.  It is also called \"absurdity\", because it is
the type from which you can extract no information.  It just exists, but has no
useful value.  That's why monadic functions that perform side effects return it.

So, our unit *function* η has the type

```Haskell
η :: a -> m a
```

Think of it as the ability to \"lift\" values into our monad.  For example, if we
make η the list constructor `[ ]`, then lifting some value "a" would be
literally `[a]`.  Your `a` now has the type `List a`, which slots into the
needed `m a` from before.  We call that lifting function `return`.  It’s best to
cast away any notion of `return` as a way of returning values from a function.
In Haskell, every time you see `return`, even at the end of do blocks, it’s just
lifting a value into a monad.

Finally, the multiplication, `μ`, is a way of reducing the structure of nested
monads.  Practically, if I have something like `[[a]]`, then applying ν to the
list of lists would strip away one set of brackets and concat the inner arrays,
yielding a longer `[a]`.  But notice, this corresponds precisely to `mconcat` in
our Monad Typeclass!  Haskell calls the monad version of this function `join`.
Here is its type:

```Haskell
join :: Monad m => m (m a) -> m a
```

Look familiar?  Here’s mconcat again:

```Haskell
mconcat :: [a] -> a
```

Replace the `m`’s with `[ ]`’s and you can translate between one and the other.

What this means is that we can *encode* the monoid laws in a monad and still
have all the benefits of being called Monoids.

## Lists Are Monads

Let's prove homogenous lists (`List a`, or in Haskell-ese `[a]`) are monads by
providing a suitable implementation of the monad typeclass.

```Haskell
instance Monad [] where  
    return x = [x]  
    xs >>= f = join (map f xs)
    
  -- Alternative definitions of bind
  --xs >>= f = concatMap f xs
  --xs >>= f = concat (map f xs)
```

But wait, there's more.  How about proving that all Lists are monoids too?

```Haskell
instance Monoid [] where
  mempty = []
  mappend = (++)
  mconcat = concat -- or join, whatever floats your boat
```

The definition of `return` should stand on its own.  The definition of bind for
lists is the truly interesting part of the typeclass.  It takes a list in the
left, then applies the function f and concats all the results together.  This is
where the confusion of monads with containers comes from.  Monads *are* things
that can be mapped over, but that is by nature of their structure.  It is not
a defining trait.

## All Together Now

So, now that we have all of our mappings from Monoids to Monads, let's derive
sequencing.  After all, what good are side effects if you can’t sequence?  One
important thing about monads is that they have “no way out” of the monad.  If we
could \"escape\" the monad, then it wouldn’t be an endofunctor, just a plain old
functor!  This is reflected in the all the function types in the monoid
typeclass as well.  There is no notion of any other type but “a”, nor should
there be (it would violate the closure law).  Just as there is no notion of
pulling values out of the monad or switching monads willy-nilly.  For that we
have comonads and functors, and those requires their own treatises.

Sequencing monads together (chaining) is accomplished by those scary looking
arrow things you’ve seen once or twice denoted

```Haskell
(>>=) :: (Monad m) => m a -> (a -> m b) -> m b
```

and

```
(>>) :: (Monad m) => m a -> m b -> m b
```

The first is pronounced “bind”, the second, “sequence”.  From bind’s type, it’s
easy to see what it does:

First, it extracts the value from the monad to its left, applies the function to
its right to that value, then gives you back the same monad with a changed
value.  Notice how there is no escape from the monad (m) part of the types, and
there is no hopping between monads.  The monad bind produces is the same one
that went in, all that changed is the value it’s indexed by.

Sequence can also be inferred from its type.  It takes the monad to the left,
evaluates whatever’s in it, discards the result, then evaluates the monad to the
right and returns it. Sounds complicated, but we also have the exact same thing
built into nearly every C-like language: the comma operator.  In C, `f(), g();`
calls f, throws away the result, then calls g and makes the result of the entire
expression its return value.

From there, all other operators are conveniences derived from the basic monad
operators and the ones we discussed.  Sequencing monads is so important that
bind is a part of the minimal complete definition of a Haskell monad.

## But Those Diagrams Doe

Those are commutative digrams, commonplace in any field involving lots of
functions.  The first is called the associativity square, and all it says is
that if I have some monad in a monad in a monad... ad nauseum, that I can keep
`join`ing until I get to a single unnested monad with all of the previous values
`mconcat`'ed (or similarly) inside.

This is trivial to illustrate with the List monad.

Here's our monad in a monad in a monad...

```
let l = [[[\"a\", \"b\", \"c\"], [\"d\", \"e\", \"f\"], [\"g\", \"h\", \"i\"]], [[\"j\", \"k\", \"l\"], [\"m\", \"n\", \"o\"], [\"p\", \"q\", \"r\"]]]
```

The left and down arrows say that if I run `join` across this list, that it'll
take away a pair of brackets.

```
join l
> [[\"a\",\"b\",\"c\"],[\"d\",\"e\",\"f\"],[\"g\",\"h\",\"i\"],[\"j\",\"k\",\"l\"],[\"m\",\"n\",\"o\"],[\"p\",\"q\",\"r\"]]
```

Repetez!

```
join $ join l
> [\"a\",\"b\",\"c\",\"d\",\"e\",\"f\",\"g\",\"h\",\"i\",\"j\",\"k\",\"l\",\"m\",\"n\",\"o\",\"p\",\"q\",\"r\"]
```

And finally

```Haskell
join $ join $ join l
> \"abcdefghijklmnopqr\"
```

You can think of the exponents next to the T as the number of brackets you have
to `join` to reach some \"minimal monad\" for which no more extraneous structure
can be removed.

The second is the unit triangle.  It says that we can take our monad, add
\"another set of brackets\" with `η` on the left or right, then `join` (`μ`) it
and get the same thing back.  This translates to Haskell as

```Haskell
join return $ return 5
> 5
```

What this means practically is that `join return` is an identity operation!
"""

main = map3 Blog.generatePost Window.dimensions (constant "Monards") (constant post)

