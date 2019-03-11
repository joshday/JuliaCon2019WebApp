using Mux

@app test = (
  Mux.defaults,
  page(respond("<html><body><h1>Landing Page!</h1></body></html>")),
  page("/about", respond("About Me!")),
  Mux.notfound())

@info "Serving app on $(ARGS[1])"
fetch(serve(test, parse(Int64, ARGS[1])))