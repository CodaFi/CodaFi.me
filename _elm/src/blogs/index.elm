import Window
import Graphics.Element as El
import Website.Blog.Formatting as Format

monardsTitle = [markdown|
<h2 style="margin-left:24px;">Monads Made Hard, Then Simple, Then Easy</h2>

<span style="margin-left:24px;">
In which we eschew aphoristic comparisons.  Because Monards.
</span>
|]

errorHandlingTitle = [markdown|
<h2 style="margin-left:24px;">Error Handling</h2>

<span style="margin-left:24px;">
In which the BSOD is praised for its innovative qualities.
</span>
|]

intercalTitle = [markdown|
<h2 style="margin-left:24px;">Variations on a RoCocoa Theme</h2>

<span style="margin-left:24px;">
In which the relevance of Esolangs is examined.
</span>
|]

helloWorldTitle = [markdown|
<h2 style="margin-left:24px; margin-top:0px;">Hello World</h2>

<span style="margin-left:24px;">
In which we question the reason for this blog's inception.
</span>
|]
                   
scene (w,h) = flow down [ container (max 500 w) 60 (midLeftAt (absolute 10) (absolute 30)) (Format.title "  CF") |> color (rgb 57 74 85),
                          container (max 500 w) 105 topLeft (box monardsTitle "http://λπω.com/blog/Monards.html" w |> width w),
                          container (max 500 w) 105 topLeft (box errorHandlingTitle "http://λπω.com/blog/Error-Handling.html" w |> width w), 
                          container (max 500 w) 105 topLeft (box intercalTitle "http://λπω.com/blog/INTERCAL.html" w |> width w), 
                          container (max 500 w) 105 (midLeftAt (absolute 0) (absolute 60)) (box helloWorldTitle "http://λπω.com/blog/HelloWorld.html" w |> width w) 
                        ]

box e l w =
  let h = heightOf e
  in flow down [ color (rgb 132 151 161) . container (w) (h+1) midTop .
                 color white . container (w+2) h midLeft <| e
               ] |> link l

main = lift scene Window.dimensions
