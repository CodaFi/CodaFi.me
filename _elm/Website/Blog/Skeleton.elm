module Website.Blog.Skeleton where

import Window
import Graphics.Element as El
import Website.Blog.Formatting as Fmt

generatePost : (Int, Int) -> String -> Element -> Element
generatePost (w,h) t postBody = let bodyHeight = heightOf (width 500 postBody)
                                    titleHeight = heightOf (Fmt.formatTitleText t)
                                in flow down [ container (max 500 w) 60 (midLeftAt (absolute 10) (absolute 30)) (Fmt.title "  CF") |> color (rgb 57 74 85),
                                               spacer (max 300 w) 100,
                                               container w titleHeight midTop (Fmt.formatTitleText t) |> El.height 160,                             
                                               container w bodyHeight midTop (width (min 550 w) postBody),
                                               spacer (max 300 w) 30
                                             ]

generateImagefulPost : (Int, Int) -> String -> String -> Element -> Element
generateImagefulPost (w,h) t im postBody = let bodyHeight = heightOf (width 500 postBody)
                                               titleHeight = heightOf (Fmt.formatTitleText t)
                                           in flow down [ container (max 300 w) 60 midLeft (Fmt.formatImagefulTitle (w, 60) "  CF" im) |> color (rgb 57 74 85),
                                                          spacer (max 300 w) 100,
                                                          container w titleHeight midTop (Fmt.formatTitleText t) |> El.height 160,                             
                                                          container w bodyHeight midTop (width (min 550 w) postBody),
                                                          spacer (max 300 w) 30
                                                        ]
