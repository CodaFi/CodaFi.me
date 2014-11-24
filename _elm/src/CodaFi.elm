import Window
import Graphics.Element as E
import Website.Blog.Skeleton as S
import Website.Blog.Formatting as Format
import Text as T

scene : (Int, Int) -> Element
scene (w, h) = flow down [S.titlebar w (Format.title "  CF"),
                          spacer w 300,
                          container w 300 middle <| (toText " λ∏ω" |> typeface ["Helvetica-Bold"] 
                                                                   |> T.height (200) 
                                                                   |> T.color (rgb 94 94 93) 
                                                                   |> T.justified),
                          container w 60 middle <| flow right [
                                      container 180 (60) midLeft <| (toText "blog" |> typeface ["Helvetica-Bold"]
                                                                                   |> T.height (36)
                                                                                   |> T.color (rgb 94 94 93)
                                                                                   |> T.link  "http://λπω.com/blog" 
                                                                                   |> T.justified),
                                       container 200 (60) middle <| (toText "projects" |> typeface ["Helvetica-Bold"] 
                                                                                       |> T.height (36)
                                                                                       |> T.color (rgb 94 94 93)
                                                                                       |> T.link  "https://github.com/CodaFi"
                                                                                       |> T.justified),
                                        container 180 (60) midRight <| (toText "about" |> typeface ["Helvetica-Bold"]
                                                                                       |> T.height (36)
                                                                                       |> T.color (rgb 94 94 93)
                                                                                       |> T.link  "http://λπω.com/About-Me"
                                                                                       |> T.justified)
                                     ]
                         ]

main = lift scene Window.dimensions
