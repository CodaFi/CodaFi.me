module Website.Blog.Skeleton where

title : String -> Element
title t = layers [ collage 100 50 [ filled (rgb 34 48 54) (circle 24) |> move (-20, 3) ],
                   (toText t) |> typeface "Helvetica-Bold" |> Text.height (24) |> header |> Text.color (rgb 132 151 161) |> text |> E.link "http://www.codafi.me" ]
                   
generatePost : (Int, Int) -> Element -> Element
scene (w,h) postBody = flow down [ container (max 500 w) 60 (midLeftAt (absolute 10) (absolute 30)) (title "  CF") |> color (rgb 57 74 85),
                                   container (max 500 w) (max 430 h) topLeft (pageBody w h classfile) |> color (rgb 79 96 107) 
                                 ] 
