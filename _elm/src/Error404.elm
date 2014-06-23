import Window
import Graphics.Element as El
import Website.Blog.Formatting as Format

notFoundTitle = [markdown|
<style type="text/css">p { text-align:justify; }</style>
# 404

Rather than a beep  
Or a rude error message,  
These words: “File not found.”

<p style="text-align:right;font-style:italic;">Anonymous</p>
|]
                   
scene (w,h) = flow down [container (max 500 w) 60 (midLeftAt (absolute 10) (absolute 30)) (Format.title "  CF") |> color (rgb 57 74 85),
                         container w h middle (box <| width 300 notFoundTitle) ]

box e =
  let w = widthOf e
      h = heightOf e
  in  flow down [ color black . container (w+40) (h+10) midTop .
                  color white . container (w+38) (h+10) midTop <| e
                ]

main = lift scene Window.dimensions