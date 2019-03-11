using Mux

@app test = (
  Mux.defaults,
  page(respond("Landing Page!")),
  page("/about", respond("About Me!")),
  Mux.notfound())

@info "Serving app on $(ARGS[1])"
fetch(serve(test, parse(Int64, ARGS[1])))