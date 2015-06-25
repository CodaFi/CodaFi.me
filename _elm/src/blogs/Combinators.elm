import Window
import Website.Blog.Skeleton as Blog
import Signal exposing (constant, map3)
import Markdown exposing (toElement)
import Graphics.Element exposing (Element, left)

post : Element
post = toElement """
## Combine Harvester

A combinator is any function that lends itself well to, obviously, combinations.
They're functions that you can chain together to make larger, more important
functions do heavy lifting with one caveat: they must only use the arguments
given to them.  Global state, explicit variables, and mutation are
forbidden in their definitions.  But one of the coolest things
about them is that you only need 3 to write any other
combinator at all.  To prove it to you, I'll define
them and use them to build the rest of the
[combinators in the Basis](https://github.com/typelift/Basis/blob/master/Basis/Combinator.swift).

## Idiots, I'm Surrounded By Idiots

This first combinator is called I, id, identity, or (my favorite) the [Idiot
Bird](http://www.angelfire.com/tx4/cus/combinator/birds.html).  It is the
combinator that returns any argument that is given to it completely unevaluated.

Its definition is trivial:

```
func idiot<A>(x : A) -> A {
    return x
}
```

## Vanity Faire

This combinator is called the K, const, constant, or Kestrel Combinator.  It
takes two arguments, completely ignores the second, and returns the first
always.  That's why it's called constant: no matter what you give it as a second
argument you'll always get back the first argument.  Its definition is less
trivial than the Idiot Bird, but it is still quite simple:

```
func kestrel<A, B>(a : A) -> B -> A {
    return { _ in a }
}
```

## Birds of a Feather

The final combinator is called the S, or Starling combinator.  Serendipitously,
it is also the definition of
[ap](http://hackage.haskell.org/package/base-4.7.0.1/docs/Prelude.html#v:ap)
for functions, but we'll get into that later.  It is complex at first
glance, but what it does is quite simple.  It takes two functions, f and g,
and a single argument compatible with the first part of both of them.  It
then procedes to apply the function g to its argument, then apply the
argument and the new g'd argument to f to give a result.  It's much easier
to see it in code than in english, so:

```
func starling<A, B, C>(f : (A -> B -> C)) -> (A -> B) -> A -> C {
    return { g in { x in f(x)(g(x)) } }
}
```

## The Fun Begins

The first combinator we're going to build with our new gang of 3 is... id.  Yes,
the Idiot Bird combinator, as it turns out, need not be a part of our gang
because it can be defined using Starlings and Kestrels.

```
func idiot<A>(a : A) -> A {
    return starling(kestrel)(kestrel(a))(a)
}
```

But we will leave it in for convenience's sake.

The first real combinator is function composition, or the bluebird combinator.
In most functional languages, this is the `(.)` combinator that allows you to
pipe functions together.  It comes in handy later, so we'll be using it to hide
a lot of the complexity of later definitions.

```
func bluebird<A, B, C>(f : (B -> C)) -> (A -> B) -> A -> C {
    return starling(kestrel(starling))(kestrel)(f)
}
```

The next combinator in line is `<|`, or the backwards application operator.  In
combinator-ese, this is known as Idiot Bird*, or an Idiot
Bird that has been [eta
expanded](http://mlton.org/EtaExpansion).  Who knew just
giving a function an argument and getting a result could
be so complicated?

```
func idiotstar<A, B>(f: A -> B) -> A -> B {
    return cardinal(bluebird(bluebird)(idiot))(idiot)(f)
}
```

Here we also define its cousin, the Thrush, which does the same thing but with its arguments flipped.

```
func thrush<A, B>(x : A) -> (A -> B) -> B {
    return cardinal(idiot)(x)
}
```

Speaking of flipping arguments to functions, how about we define a bird that does that?

```
func cardinal<A, B, C>(f : (A -> B -> C)) -> B -> A -> C {
    return starling(bluebird(bluebird)(starling))(kestrel(kestrel))(f)
}
```

One that curiously doesn't have a bird name is the Psi-combinator, which Haskell
calls
[on](http://hackage.haskell.org/package/base-4.7.0.1/docs/Data-Function.html#v:on).
In order to define it we will need the Dovekie combinator, which is a bunch of
bluebirds fed to each other, and a cousin of the cardinal:

```
func dovekie<A, B, C, D, E>(f : (C -> D -> E)) -> (A -> C) -> A -> (B -> D) -> B -> E {
    return bluebird(bluebird)(bluebird(bluebird))(f)
}
```

```
func cardinalstar<A, B, C, D>(f : (A -> C -> B -> D)) -> A -> B -> C -> D {
    return bluebird(cardinal)(f)
}
```

```
func psi<A, B, C>(f : (B -> B -> C)) -> (A -> B) -> A -> A -> C {
    return cardinal(bluebird(starling)(bluebird(cardinalstar)(dovekie)))(idiotstar)(f)
}
```   

There's a veritable [Aviary of
Birds](https://gist.github.com/CodaFi/10afdd77e42bb8ad18ab) that can be
written in terms of the S and K combinators.  Going further, every function ever
written has just been S's and K's hidden by syntax and
abstractions we all take for granted.  This is because the SKI
calculus (or a calculus literally consisting of Starlings,
Kestrels, and Idiots) is Turing Complete. 

But this interdefinability is precisely what makes combinators so powerful.
They're neat little atomic units of computation that can be strung together to
make bigger, more useful units.  As we've shown here today, all it takes it just
a little creativity and some function application and you can do anything.
After all, that's one of the underlying principles behind declarative
programming: we can build bigger better things vertically rather than
horizontally.  Let your types worry about the plumbing and start throwing birds
around until something works!    
"""

main = map3 Blog.generatePost Window.dimensions (constant "Combinators") (constant post)

