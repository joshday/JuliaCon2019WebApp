using Mux, Observables, Interact, CSSUtil, WebIO, Markdown, Dates
using Observables: @map

const PORT = parse(Int64, ARGS[1])

#-----------------------------------------------------------------------# ui
x1 = slider(1:50) |> onchange
x1out = @map "The slider's value is $(&x1)"

x2 = checkboxes(1:5)
x2out = @map "You have checked: $(&x2)"

x3 = datepicker(today())
x3out = @map "Date picker widget is $(&x3)"

x4 = textbox("Enter text here")
x4out = @map "Echo: $(&x4)"

x5 = button("Click me!")
x5 = @map "You've clicked this button $(&x5) times"

ui = vbox(
    "Interact is neat!",
    x1, x1out,
    x2, x2out,
    x3, x3out,
    x4, x4out,
    x5, x5out
)

#-----------------------------------------------------------------------# Run Server
WebIO.webio_serve(page("/", req -> ui), PORT)