import Window
import Graphics.Element as E

title : String -> Element
title t = layers [ collage 100 50 [ filled (rgb 34 48 54) (circle 24) |> move (-20, 3) ],
                   (toText t) |> typeface "Helvetica-Bold" |> Text.height (24) |> header |> Text.color (rgb 132 151 161) |> text |> E.link "http://www.codafi.me" ]

formatInt : Int -> Element
formatInt t = (show t) |> toText  
                       |> Text.height (14) 
                       |> typeface "Menlo-Regular"
                       |> Text.color (rgb 132 151 161)
                       |> text
                                             
classfile : Element
classfile = [markdown|
<style type="text/css">
	
:link { text-decoration: none; color: white }
:visited { text-decoration: none; color: white }
:hover { text-decoration: none; color: white }

.keyword          { font-size: 12pt; color: #760F50 }
.string           { color: #4A9D8F; }
.plainCode        { font-size: 12pt; color: white; font-family: menlo-regular }
.classObject      { font-size: 12pt; color: #E35B00; font-family: menlo-regular }
.preprocessor     { font-size: 12pt; color: #EBC562; font-family: menlo-regular }
.method           { color: #236E25 }
.method:link      { text-decoration: none; color: white }
.method:visited   { text-decoration: none; color: white }
.method:hover     { text-decoration: none; color: white }
.comment          { color: #236E25 }
.comment:link     { text-decoration: none; color: #236E25 }
.comment:visited  { text-decoration: none; color: #236E25 }
.comment:hover    { text-decoration: none; color: #236E25 }

</style>

<span class="preprocessor">
\#if TARGET_OS_MAC
	<br>&nbsp;&nbsp;\#import <span class="string">\<AppKit/AppKit.h\></span> </br>
\#elif defined(\_\_IPHONE_OS_VERSION_MIN_REQUIRED)
	<br>&nbsp;&nbsp;\#import <span class="string">\<UIKit/UIKit.h\></span> </br>
\#else
	<br>&nbsp;&nbsp;\#warning </br>
\#endif  
</span>

<span class="plainCode">
<span class="preprocessor">@interface</span> CFIWebsite : <span class="classObject">NSURL</span> \<<span class="classObject">NSCoding</span>\> <br></br>
\+ (<span class="preprocessor">instancetype</span>)<a class="method"; href="http://www.codafi.me">currentWebsite</a>; <br></br>
\- (<span class="classObject">NSArray</span> *)<a class="method"; href="https://github.com/CodaFi?tab=repositories">projects</a>;
<br>\- (<span class="classObject">NSURL</span> *)<a class="method"; href="http://www.codafi.me/blog">blog</a>; </br>
\- (<span class="classObject">NSString</span> *)<a class="method"; href="http://www.codafi.me/about">description</a>;
<br></br>
<span class="preprocessor">@end</span>
</span>  
|]
 
lineNumbersColumn : (Int, Int) -> [Int] -> Element 
lineNumbersColumn (w,h) nums = flow down <| (spacer 30 15) :: (map formatInt nums)
                      
pageBody : Int -> Int -> Element -> Element
pageBody w h bdy = flow right [ spacer 10 w,
                                container 30 h topLeft (lineNumbersColumn (w, h) [1..18]) |> color (rgb 79 96 107),
                                bdy 
                              ]
                      
scene : (Int, Int) -> Element
scene (w,h) = flow down [ container (max 500 w) 60 (midLeftAt (absolute 10) (absolute 30)) (title "  CF") |> color (rgb 57 74 85),
                          container (max 500 w) (max 430 h) topLeft (pageBody w h classfile) |> color (rgb 79 96 107) 
                        ] 
 
main = lift scene Window.dimensions