using Mux, Observables, Interact, CSSUtil, WebIO

const PORT = parse(Int64, ARGS[1])

#-----------------------------------------------------------------------# ui
x1 = slider(1:50)
x1out = Observable("")
on(x -> x1out[] = "slider's values is $x", observe(x1))

ui = vbox(
    x1, x1out, CSSUtil.hline(),
    "Hi"
)

#-----------------------------------------------------------------------# Run Server
WebIO.webio_serve(page("/", req -> ui), PORT)