import Window
import Website.Blog.Skeleton as Blog
import Signal exposing (constant, map3)
import Markdown exposing (toElement)
import Graphics.Element exposing (Element, left)

post : Element
post = toElement """
<p>
++++++++++[>+++++++>++++++++++>+++>+<<<<-]>++.>+.+++++++..+++.>++.<<+++++++++++++++.>.+++.------.--------.>+.>.
</p>
"""

main = map3 Blog.generatePost Window.dimensions (constant "Hello, World") (constant post)
