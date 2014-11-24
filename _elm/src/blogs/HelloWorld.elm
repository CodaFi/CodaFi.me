import Window
import Website.Blog.Skeleton as Blog

post : Element
post = [markdown|
<p>
++++++++++[>+++++++>++++++++++>+++>+<<<<-]>++.>+.+++++++..+++.>++.<<+++++++++++++++.>.+++.------.--------.>+.>.
</p>
|]

main = lift3 Blog.generatePost Window.dimensions (constant "Hello, World") (constant post)
