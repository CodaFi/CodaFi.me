import Window
import Website.Blog.Formatting as Format
import Signal exposing (constant, map)
import Markdown exposing (toElement)
import Color exposing (..)
import Graphics.Element exposing (Element, flow, down, left, color, link, width, widthOf, height, heightOf)
import Graphics.Element exposing (container, midLeft, midLeftAt, midTop, midTopAt, topLeft, absolute)

monadicComputering = toElement """
<h2 style="margin-left:24px;">Monadic Computering</h2>

<span style="margin-left:24px;">
Monads, they're not just for breakfast after you thought you could
eat that whole Chipotle order by yourself.
</span>
"""

combinatorsTitle = toElement """
<h2 style="margin-left:24px;">Birds and Building Blocks</h2>

<span style="margin-left:24px;">
In which we use angry birds to build, rather than destroy, things.
</span>
"""

fpInSwiftIntroTitle = toElement """
<h2 style="margin-left:24px;">FP in Swi... Compilation Aborted: SEGFAULT</h2>

<span style="margin-left:24px;">
In which we begin something new and exciting.
</span>
"""

monardsTitle = toElement """
<h2 style="margin-left:24px;">Monads Made Hard, Then Simple, Then Easy</h2>

<span style="margin-left:24px;">
In which we eschew aphoristic comparisons.  Because Monards.
</span>
"""

errorHandlingTitle = toElement """
<h2 style="margin-left:24px;">Error Handling</h2>

<span style="margin-left:24px;">
In which the BSOD is praised for its innovative qualities.
</span>
"""

intercalTitle = toElement """
<h2 style="margin-left:24px;">Variations on a RoCocoa Theme</h2>

<span style="margin-left:24px;">
In which the relevance of Esolangs is examined.
</span>
"""

helloWorldTitle = toElement """
<h2 style="margin-left:24px; margin-top:0px;">Hello World</h2>

<span style="margin-left:24px;">
In which we question the reason for this blog's inception.
</span>
"""
cell (a, u, w) = container (max 500 w) 105 topLeft (box a u w |> width w)

scene (w,h) = flow down [ container (max 500 w) 60 (midLeftAt (absolute 10) (absolute 30)) (Format.title "  CF") |> color (rgb 57 74 85),
                          cell (monadicComputering, "http://λπω.com/blog/Monadic-Computering.html", w),
                          cell (combinatorsTitle, "http://λπω.com/blog/Combinators.html", w),
                          cell (fpInSwiftIntroTitle, "http://λπω.com/blog/FP-In-Swift-Intro.html", w),
                          cell (monardsTitle, "http://λπω.com/blog/Monards.html", w),
                          cell (errorHandlingTitle, "http://λπω.com/blog/Error-Handling.html", w),
                          cell (intercalTitle, "http://λπω.com/blog/INTERCAL.html", w),
                          container (max 500 w) 105 (midLeftAt (absolute 0) (absolute 60)) (box helloWorldTitle "http://λπω.com/blog/HelloWorld.html" w |> width w)
                        ]

box e l w =
  let h = heightOf e
  in flow down [ color (rgb 132 151 161) << container (w) (h+1) midTop <<
                 color white << container (w+2) h midLeft <| e
               ] |> link l

main = map scene Window.dimensions
