CC=elm
CFLAGS=--runtime="/elm-runtime.js"

all: CodaFi Error404 BlogIndex HelloWorldBlog INTERCALBlog ErrorBlog

CodaFi: ./src/CodaFi.elm
	$(CC) $(CFLAGS) $<
	mv ./build/src/CodaFi.html ./../index.html

Error404: ./src/Error404.elm
	$(CC) $(CFLAGS) $<
	mv ./build/src/Error404.html ./../404.html

BlogIndex: ./src/blogs/index.elm
	$(CC) $(CFLAGS) --make $<
	mkdir -p ./../blog
	mv ./build/src/blogs/index.html ./../blog/index.html

HelloWorldBlog: ./src/blogs/HelloWorld.elm
	$(CC) $(CFLAGS) --make $<
	mv ./build/src/blogs/HelloWorld.html ./../blog/HelloWorld.html

INTERCALBlog: ./src/blogs/INTERCAL.elm
	$(CC) $(CFLAGS) --make $<
	mv ./build/src/blogs/INTERCAL.html ./../blog/INTERCAL.html

ErrorBlog: ./src/blogs/Error-Handling.elm
	$(CC) $(CFLAGS) --make $<
	mv ./build/src/blogs/Error-Handling.html ./../blog/Error-Handling.html
