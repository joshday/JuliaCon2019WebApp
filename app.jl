using Mux, Observables, Interact, CSSUtil, WebIO, Markdown, Dates
using Observables: @map

const PORT = isempty(ARGS) ? 8888 : parse(Int64, ARGS[1])

#-----------------------------------------------------------------------# ui
@info "Defining UI..."

x1 = slider(1:50) |> onchange
x1out = @map "The slider's value is $(&x1)"

x2 = checkboxes(1:5)
x2out = @map "You have checked: $(&x2)"

x3 = widget([:on, :off])
x3out = @map "On or off? $(&x3)"

x4 = textbox("Enter text here")
x4out = @map "Echo: $(&x4)"

x5 = button("Click me!")
x5out = @map "You've clicked this button $(&x5) times"

style1 = style("background-color" => "lightgray", "padding" => "5px")
style2 = style("background-color" => "lightblue", "padding" => "5px")

ui(req) = vbox(
    "Interact is neat!",
    hline(),
    hbox(x1, x1out)(style1),
    hline(),
    hbox(x2, x2out)(style2),
    hline(),
    hbox(x3, x3out)(style1),
    hline(),
    hbox(x4, x4out)(style2),
    hline(),
    hbox(x5, x5out)(style1)
)(style("padding" => "10px"))

#-----------------------------------------------------------------------# Run Server
@info "Running server..."
fetch(WebIO.webio_serve(page("/", ui), PORT))