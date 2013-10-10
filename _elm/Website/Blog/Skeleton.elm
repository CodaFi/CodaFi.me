module Website.Blog.Skeleton where

import Window
import Graphics.Element as El
import Website.Blog.Formatting as Fmt

generatePost : (Int, Int) -> String -> Element -> Element
generatePost (w,h) t postBody = let bodyHeight = fst <| sizeOf postBody
                                in flow down [ container (max 500 w) 60 (midLeftAt (absolute 10) (absolute 30)) (Fmt.title "  CF") |> color (rgb 57 74 85),
                                               spacer (max 300 w) 30,
                                               container (max 300 w) 60 middle (Fmt.formatTitleText t),                             
                                               container w h midTop (size (min 550 w) (max bodyHeight h) postBody)
                                             ] 

generateImagefulPost : (Int, Int) -> String -> String -> Element -> Element
generateImagefulPost (w,h) t im postBody = let bodyHeight = fst <| sizeOf postBody
                                           in flow down [ container (max 300 w) 60 midLeft (Fmt.formatImagefulTitle (w, 60) "  CF" im) |> color (rgb 57 74 85),
                                                          spacer (max 300 w) 30,
                                                          container (max 300 (w + 20)) 60 middle (Fmt.formatTitleText t),                             
                                                          container w h midTop (size (min 550 w) (max bodyHeight h) postBody)
                                                        ]