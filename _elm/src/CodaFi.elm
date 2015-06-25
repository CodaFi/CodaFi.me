import Window
import Graphics.Element exposing (..)
import Website.Blog.Skeleton as S
import Website.Blog.Formatting as Format
import Text as T
import Color exposing (..)
import Signal exposing (map)

scene : (Int, Int) -> Element
scene (w, h) = flow down [S.titlebar w (Format.title "  CF"),
                          spacer w 300,
                          container w 300 middle <| (T.fromString " λ∏ω" |> T.typeface ["Helvetica-Bold"] 
                                                                   |> T.height (200) 
                                                                   |> T.color (rgb 94 94 93) 
                                                                   |> justified),
                          container w 60 middle <| flow right [
                                      container 180 (60) midLeft <| (T.fromString "blog" |> T.typeface ["Helvetica-Bold"]
                                                                                   |> T.height (36)
                                                                                   |> T.color (rgb 94 94 93)
                                                                                   |> T.link  "http://λπω.com/blog" 
                                                                                   |> justified),
                                       container 200 (60) middle <| (T.fromString "projects" |> T.typeface ["Helvetica-Bold"] 
                                                                                       |> T.height (36)
                                                                                       |> T.color (rgb 94 94 93)
                                                                                       |> T.link  "https://github.com/CodaFi"
                                                                                       |> justified),
                                        container 180 (60) midRight <| (T.fromString "about" |> T.typeface ["Helvetica-Bold"]
                                                                                       |> T.height (36)
                                                                                       |> T.color (rgb 94 94 93)
                                                                                       |> T.link  "http://λπω.com/About-Me"
                                                                                       |> justified)
                                     ]
                         ]

main = map scene Window.dimensions
