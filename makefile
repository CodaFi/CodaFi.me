CC=elm
CFLAGS=--cache-dir="_elm/cache" --build-dir="_elm/build" --src-dir="_elm" --set-runtime="elm-runtime.js" --make
SRC=./_elm

all: CodaFi Error404 AboutMe BlogIndex HelloWorldBlog INTERCALBlog ErrorBlog MonardsBlog FPInSwiftIntro

CodaFi: $(SRC)/src/CodaFi.elm
	$(CC) $(CFLAGS) $<
	mv $(SRC)/build/_elm/src/CodaFi.html ./index.html

Error404: $(SRC)/src/Error404.elm
	$(CC) $(CFLAGS) $<
	mv $(SRC)/build/_elm/src/Error404.html ./404.html

AboutMe: $(SRC)/src/About-Me.elm
	$(CC) $(CFLAGS) $<
	mv $(SRC)/build/_elm/src/About-Me.html ./About-Me.html

BlogIndex: $(SRC)/src/blogs/index.elm
	$(CC) $(CFLAGS) $<
	mkdir -p ./../blog
	mv $(SRC)/build/_elm/src/blogs/index.html ./blog/index.html

HelloWorldBlog: $(SRC)/src/blogs/HelloWorld.elm
	$(CC) $(CFLAGS) $<
	mv $(SRC)/build/_elm/src/blogs/HelloWorld.html ./blog/HelloWorld.html

INTERCALBlog: $(SRC)/src/blogs/INTERCAL.elm
	$(CC) $(CFLAGS) $<
	mv $(SRC)/build/_elm/src/blogs/INTERCAL.html ./blog/INTERCAL.html

ErrorBlog: $(SRC)/src/blogs/Error-Handling.elm
	$(CC) $(CFLAGS) $<
	mv $(SRC)/build/_elm/src/blogs/Error-Handling.html ./blog/Error-Handling.html

MonardsBlog: $(SRC)/src/blogs/Monards.elm
	$(CC) $(CFLAGS) $<
	mv $(SRC)/build/_elm/src/blogs/Monards.html ./blog/Monards.html

FPInSwiftIntro: $(SRC)/src/blogs/FP-In-Swift-Intro.elm
	$(CC) $(CFLAGS) $<
	mv $(SRC)/build/_elm/src/blogs/FP-In-Swift-Intro.html ./blog/FP-In-Swift-Intro.html
