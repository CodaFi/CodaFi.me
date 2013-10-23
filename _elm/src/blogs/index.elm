import Window
import Graphics.Element as El

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


title : String -> Element
title t = layers [ collage 100 50 [ filled (rgb 34 48 54) (circle 24) |> move (-20, 3) ],
                   (toText t) |> typeface "Helvetica-Bold" |> Text.height (24) |> header |> Text.color (rgb 132 151 161) |> text |> El.link "http://www.codafi.me" ]
                   
                   
scene (w,h) = flow down [container (max 500 w) 60 (midLeftAt (absolute 10) (absolute 30)) (title "  CF") |> color (rgb 57 74 85),
                         container (max 500 w) 135 topLeft (box intercalTitle "http://codafi.me/blog/INTERCAL.html" w |> width w), 
                         container (max 500 w) 135 topLeft (box helloWorldTitle "http://codafi.me/blog/HelloWorld.html" w |> width w) 
                        ]

box e l w =
  let h = heightOf e
  in flow down [ color (rgb 132 151 161) . container (w) (h+1) midTop .
                 color white . container (w+2) h midLeft <| e
               ] |> link l

main = lift scene Window.dimensions