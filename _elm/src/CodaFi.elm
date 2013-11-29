import Window
import Graphics.Element as E
import Random

title : String -> Element
title t = layers [ collage 100 50 [ filled (rgb 34 48 54) (circle 24) |> move (-20, 3) ],
                   (toText t) |> typeface "Helvetica-Bold" |> Text.height (24) |> header |> Text.color (rgb 132 151 161) |> text |> E.link "http://www.codafi.me" ]

formatInt : Int -> Element
formatInt t = (show t) |> toText  
                       |> Text.height (14) 
                       |> typeface "Menlo, Monaco, Helvetica, sans-serif"
                       |> Text.color (rgb 132 151 161)
                       |> text

range : Int -> Int -> [Int]
range n m = if 
             | n == m -> [n]
             | n < m -> n::(range (n+1) m)
             | n > m -> n::(range (n-1) m)

rubyClassElement : Element
rubyClassElement = [markdown|
<style type="text/css">

:link { text-decoration: none; color: white }
:visited { text-decoration: none; color: white }
:hover { text-decoration: none; color: white }

.keyword          { font-size: 12pt; color: #EBC562; font-family: Menlo, Monaco, Helvetica, sans-serif; }
.string           { color: #4A9D8F; }
.plainCode        { font-size: 12pt; color: white; font-family: Menlo, Monaco, Helvetica, sans-serif; }
.classObject      { font-size: 12pt; color: #89730c; font-family: Menlo, Monaco, Helvetica, sans-serif; }
.method           { color: #1b75b4 }
.method:link      { text-decoration: none; color: #1b75b4 }
.method:visited   { text-decoration: none; color: #1b75b4 }
.method:hover     { text-decoration: none; color: #1b75b4 }

</style>

<span class="plainCode">
<span class="keyword">module</span> URI <br>&nbsp;&nbsp;Website < <span class="classObject">Generic</span></br>
<span class="classObject">&nbsp;&nbsp;&nbsp;&nbsp;def </span><a class="method"; href="https://github.com/CodaFi?tab=repositories">projects</a>
<br><span class="classObject">&nbsp;&nbsp;&nbsp;&nbsp;end</span></br>
<br><span class="classObject">&nbsp;&nbsp;&nbsp;&nbsp;def </span><a class="method"; href="http://www.codafi.me/blog">blog</a>
<br><span class="classObject">&nbsp;&nbsp;&nbsp;&nbsp;end</span></br>
<br><span class="classObject">&nbsp;&nbsp;&nbsp;&nbsp;def </span><a class="method"; href="http://www.codafi.me/about">inspect</a></br>
<span class="classObject">&nbsp;&nbsp;&nbsp;&nbsp;end</span>
<br><span class="classObject">&nbsp;&nbsp;end</span></br>
<span class="classObject">end</span>
</span>  
|]

objcClassElement : Element
objcClassElement = [markdown|
<style type="text/css">

:link { text-decoration: none; color: white }
:visited { text-decoration: none; color: white }
:hover { text-decoration: none; color: white }

.keyword          { font-size: 12pt; color: #760F50 }
.string           { color: #4A9D8F; }
.plainCode        { font-size: 12pt; color: white; font-family: Menlo, Monaco, Helvetica, sans-serif; }
.classObject      { font-size: 12pt; color: #E35B00; font-family: Menlo, Monaco, Helvetica, sans-serif; }
.preprocessor     { font-size: 12pt; color: #EBC562; font-family: Menlo, Monaco, Helvetica, sans-serif; }
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
\#else
  <br>&nbsp;&nbsp;\#import <span class="string">\<UIKit/UIKit.h\></span> </br>
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
 
haskellElement : Element 
haskellElement = [markdown|
<style type="text/css">

:link { text-decoration: none; color: white }
:visited { text-decoration: none; color: white }
:hover { text-decoration: none; color: white }

.reserved         { font-size: 12pt; color: #dc276c; font-family: Menlo, Monaco, Helvetica, sans-serif; }
.plainCode        { font-size: 12pt; color: white; font-family: Menlo, Monaco, Helvetica, sans-serif; }
.dataType         { font-size: 12pt; color: #ae81ff; font-family: Menlo, Monaco, Helvetica, sans-serif; }
.monad            { font-size: 12pt; color: #66d9ef; font-family: Menlo, Monaco, Helvetica, sans-serif; }
.keyword          { font-size: 12pt; color: #a6e22d; font-family: Menlo, Monaco, Helvetica, sans-serif; }

</style>

<span class="plainCode">
<span class="reserved">module</span> CFI.Website.Utils <span class="reserved">where</span>
<br><span class="reserved">type</span> <span class="dataType">URL</span> = <span class="dataType">String</span></br>

<span class="reserved">class</span> <span class="monad">Monad</span> m =\> <span class="keyword">MonadWebsite</span> m <span class="reserved">where</span>
<br><span class="keyword">&nbsp;&nbsp;projects</span> :: URL <span class="reserved">-\></span> [m ()]</br>
<span class="keyword">&nbsp;&nbsp;blog</span> :: URL <span class="reserved">-\></span> m ()
<br><span class="keyword">&nbsp;&nbsp;show</span> :: URL <span class="reserved">-\></span> m ()</br>

<span class="reserved">instance</span> <span class="monad">MonadWebsite IO</span> <span class="reserved">where</span>
<br><span class="keyword">&nbsp;&nbsp;projects</span> = githubProjects</br>
<span class="keyword">&nbsp;&nbsp;blog</span> = gotoBlog
<br><span class="keyword">&nbsp;&nbsp;show</span> = putStrLn</br>
</span>
|]


allElements : [(Element, Int)]
allElements = [(objcClassElement, 16),
               (rubyClassElement, 13),
               (haskellElement, 13)]

elementAt : [(Element, Int)] -> Int -> (Element, Int)
elementAt xs n = case xs of 
                    [] -> (objcClassElement, 16)
                    lst -> (head . drop n) lst

lineNumbersColumn : (Int, Int) -> [Int] -> Element 
lineNumbersColumn (w,h) nums = flow down <| (spacer 30 14) :: (map formatInt nums)
                      
pageBody : Int -> Int -> Int -> Element -> Element
pageBody w h lns bdy = flow right [ spacer 10 w,
                                    container 30 h topLeft (lineNumbersColumn (w, h) (range 1 lns)) |> color (rgb 79 96 107),
                                    bdy 
                                  ]
                      
scene : (Int, Int) -> Int -> Element
scene (w,h) n = let el = fst (elementAt allElements n)
                    lines = snd (elementAt allElements n)
                in flow down [ container (max 500 w) 60 (midLeftAt (absolute 10) (absolute 30)) (title "  CF") |> color (rgb 57 74 85),
                               container (max 500 w) (max 430 h) topLeft (pageBody w h lines el) |> color (rgb 79 96 107) 
                             ] 
 
main = lift2 scene Window.dimensions (Random.range 0 2 (constant ()))

