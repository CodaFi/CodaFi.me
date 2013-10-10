import Window
import Website.Blog.Skeleton as Blog

post : Element
post = [markdown|
<p>
Some Test Markdown
</p>
|]

main = lift3 Blog.generatePost Window.dimensions (constant "Test Title") (constant post)