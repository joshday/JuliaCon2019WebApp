using Mux

@app test = (
  Mux.defaults,
  page(respond("<h1>Hello World!!</h1>")),
  page("/about",
       probabilty(0.1, respond("<h1>Boo!</h1>")),
       respond("<h1>About Me</h1>")),
  page("/user/:user", req -> "<h1>Hello, $(req[:params][:user])!</h1>"),
  Mux.notfound())

@info "Serving app on $(ARGS[1])"
serve(test, "https://polar-shore-85058.herokuapp.com", ARGS[1])