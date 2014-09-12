import Window
import Graphics.Element as E
import Website.Blog.Formatting as Format

scene : (Int, Int) -> Element
scene (w, h) = flow down [container (max 500 w) 60 (midLeftAt (absolute 10) (absolute 30)) (Format.title "  CF") |> color (rgb 57 74 85),
                          spacer w 300,
                          container w 300 middle  <| (toText " λ∏ω" |>
                                                    typeface ["Helvetica-Bold"] |>
                                                    Text.height (200) |>
                                                    Text.color (rgb 94 94 93) |>
                                                    Text.justified),
                          container w 60 middle <| flow right [
                                      container 180 (60) midLeft <| (toText "blog" |>
                                                      typeface ["Helvetica-Bold"] |>
                                                      Text.height (36) |>
                                                      Text.color (rgb 94 94 93) |>
                                                      Text.link  "http://λ∏ω.com/blog" |>
                                                      Text.justified),
                                       container 200 (60) middle   <| (toText "projects" |>
                                                      typeface ["Helvetica-Bold"] |>
                                                      Text.height (36) |>
                                                      Text.color (rgb 94 94 93) |>
                                                      Text.link  "https://github.com/CodaFi" |>
                                                      Text.justified),
                                        container 180 (60) midRight <| (toText "about" |>
                                                      typeface ["Helvetica-Bold"] |>
                                                      Text.height (36) |>
                                                      Text.color (rgb 94 94 93) |>
                                                      Text.link  "http://λ∏ω.com/About-Me" |>
                                                      Text.justified)
                                     ]
                         ]

main = lift scene Window.dimensions
