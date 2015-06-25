module Website.Blog.Formatting where

import Graphics.Element exposing (..)
import Graphics.Collage exposing (..)
import Text as T
import Basics exposing (..)
import Color exposing (..)

titleStyle : T.Style
titleStyle = 
    { typeface = ["Helvetica"]
    , height = Just 24
    , color = (rgb 132 151 161)
    , bold = True
    , italic = False
    , line = Nothing
    }
        
title : String -> Element
title t = layers [ collage 100 50 [ filled (rgb 34 48 54) (circle 24) |> move (-20, 0) ],
                   flow down [spacer 0 12, (T.fromString t) |> T.style titleStyle |>  justified]                
                 ] |> link "http://λπω.com"

formatImagefulTitle : (Int, Int) -> String -> String -> Element
formatImagefulTitle (w,h) t im = flow outward [ fittedImage  w h im, 
                                                container 100 h (topLeftAt (absolute 10) (absolute 4)) (title t)
                                              ]                 

formatTitleText : String -> Element
formatTitleText s = (T.fromString s) |> T.typeface ["Helvetica-Bold"] 
                                    |> T.height (36) 
                                    |> T.color (rgb 94 94 93) 
                                    |> justified

formatFunctionText : String -> Element
formatFunctionText s = (T.fromString s) |> T.typeface ["Computer Modern Roman"]
                                  |> T.height (36) 
                                  |> justified
