import Window
import Graphics.Element exposing (..)
import Website.Scroll exposing (..)
import Website.Blog.Skeleton as S
import Website.Blog.Formatting as Format
import Text as T
import Color exposing (..)
import Signal exposing (map2)

pos_fun : Float -> Float
pos_fun f = max (f / 200) 0

lam_pos : Float -> Pos
lam_pos f = relative <| pos_fun f

lam_style : (T.Text -> Element) -> T.Text -> Element
lam_style f t = t |> T.typeface ["Helvetica-Bold"]
                |> T.height (200)
                |> T.color (rgb 94 94 93)
                |> f

lam : (Int, Int) -> Float -> Element
lam (w, h) f = flow right [ (container (w//3) 250 (midBottomAt (absolute <| (w//6) - (round f)) (absolute 30)) <| (T.fromString "λ" |> lam_style rightAligned)),
                            (container (w//3) 200 (midBottomAt (absolute (w//6)) (lam_pos f)) <| (T.fromString "∏" |> lam_style centered)),
                            (container (w//3) 250 (midBottomAt (absolute <| (w//6) + (round f)) (absolute 30)) <| (T.fromString "ω" |> lam_style leftAligned))
                          ]

scene : (Int, Int) -> Float -> Element
scene (w, h) d = flow down [S.titlebar w (Format.title "  CF"),
                          spacer w 300,
                          container w 300 middle <| lam (w, h) d,
                          container w 60 middle <| flow right [
                                      container (max (w//3) 100) (60) middle <| (T.fromString "blog" |> T.typeface ["Helvetica-Bold"]
                                                                                   |> T.height (36)
                                                                                   |> T.color (rgb 94 94 93)
                                                                                   |> T.link  "http://λπω.com/blog"
                                                                                   |> justified),
                                       container (max (w//3) 200) (60) middle <| (T.fromString "projects" |> T.typeface ["Helvetica-Bold"]
                                                                                       |> T.height (36)
                                                                                       |> T.color (rgb 94 94 93)
                                                                                       |> T.link  "https://github.com/CodaFi"
                                                                                       |> justified),
                                        container (max (w//3) 100) (60) middle <| (T.fromString "about" |> T.typeface ["Helvetica-Bold"]
                                                                                       |> T.height (36)
                                                                                       |> T.color (rgb 94 94 93)
                                                                                       |> T.link  "http://λπω.com/About-Me"
                                                                                       |> justified)
                                     ]
                         ]

main = map2 scene Window.dimensions delta
