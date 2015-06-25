import Window
import Graphics.Element exposing (..)
import Graphics.Collage exposing (..)
import Website.Blog.Formatting as Format
import Markdown exposing (toElement)
import Signal exposing (map)
import Color exposing (..)

scene (w,h) = flow down [container (max 500 w) 60 (midLeftAt (absolute 10) (absolute 30)) (Format.title "  CF") |> color (rgb 57 74 85),
                            layers [
                                container (max 500 w) (h - 60) middle <|
                                flow down [
                                    flow right [ Format.formatTitleText "Music",
                                                  collage 250 50 [ filled (rgb 34 48 54) (rect 225 2),
                                                                   filled (rgb 34 48 54) (ngon 3 20) |> scale 0.25 |> moveX 115
                                                                 ],
                                                  Format.formatTitleText "Code"
                                                ],
                                    flow right [ collage 400 250 [ filled (rgb 34 48 54) (rect 2 400) |> moveX -150,
                                                                   filled (rgb 34 48 54) (ngon 3 20) |> scale 0.25 |> rotate (degrees -90) |> moveY -121 |> moveX -150,
                                                                   filled (rgb 34 48 54) (rect 2 400) |> moveX 190,
                                                                   filled (rgb 34 48 54) (ngon 3 20) |> scale 0.25 |> rotate (degrees -90) |> moveY -121 |> moveX 190
                                                                 ]
                                                ],           
                                    flow right [ Format.formatTitleText "Theory",
                                      collage 250 50 [ filled (rgb 34 48 54) (rect 225 2),
                                                       filled (rgb 34 48 54) (ngon 3 20) |> scale 0.25 |> moveX 115
                                                     ],
                                      Format.formatTitleText "Me"
                                    ]
                                ],

                                container (max 750 w) (h - 60) middle <|
                                flow down [
                                      toElement """<font size="6">μ<sub>A</sub>⊗id<sub>A</sub></font>""",
                                      spacer 0 300,
                                      toElement """<font size="6">&nbsp;&nbsp;&nbsp;&nbsp;μ<sub>A</sub></font>"""
                                ],

                                container (max 750 w) (h - 60) middle <|
                                (toElement """<font size="6">id<sub>A</sub>⊗μ<sub>A</sub></font>""") `beside` (spacer 400 0) `beside`
                                (toElement """<font size="6">μ<sub>A</sub></font>""") `beside` (spacer 60 0)
                            ]
                        ]


main = map scene Window.dimensions