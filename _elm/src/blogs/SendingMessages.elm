import Window
import Website.Blog.Skeleton as Blog

post : Element
post = [markdown|
<p>

	
When somebody actually calls [myBlah hello:friend];, a few things have to happen beforehand to make sure that your message winds up in the right place with the right arguments.  

First, during compilation, `- (void)hello:(id)arg1` is turned into an IMP (a function pointer) and a selector (a char array).  The IMP looks something like this:

```
void hello(id __unsafe_unretained self, SEL _cmd, id arg1);
```

but the SEL is a little harder to model, as the runtime caches it and returns an interned version from its the global dispatch table so it doesn't have to go hunting for the method definition with a bunch of dereferences every time.  The name of the method, though, does get stored in the Data Segment section of your binary, so it can be DS'd off for submission to [code]objc_msgSend()[/code].

Second, at the call site the compiler has a few options.  If your method does happen to return something odd like a struct, or calls through to super, or is a common enough method to have been put into the dispatch vTable, the proper cousin of [code]objc_msgSend()[/code] is emitted to handle it.  But because you're just calling this method with what looks to be another object and ignoring the retVal, I will assume [code]objc_msgSend()[/code] suffices.  
</p>
|]

main = lift3 Blog.generatePost Window.dimensions (constant "Sending A Message") (constant post)