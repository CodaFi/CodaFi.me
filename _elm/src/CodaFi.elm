import Window
import Graphics.Element as E
import Website.Blog.Formatting as Format
             
scene : (Int, Int) -> Element
scene (w, h) = flow down [container (max 500 w) 60 (midLeftAt (absolute 10) (absolute 30)) (Format.title "  CF") |> color (rgb 57 74 85),
                          container w h middle  <| (toText "λ∏ω" |> 
                                                    typeface ["Helvetica-Bold"] |> 
                                                    Text.height (200) |> 
                                                    Text.color (rgb 94 94 93) |> 
                                                    Text.justified)
                          ]
 
main = lift scene Window.dimensions
