using Mux

@app test = (
  Mux.defaults,
  page(respond("<h1>Hello World!!</h1>")),
  page("/about", respond("<h1>About Me</h1>")),
  Mux.notfound())

@info "Serving app on $(ARGS[1])"
fetch(serve(test, parse(Int64, ARGS[1])))