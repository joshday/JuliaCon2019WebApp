using Mux, Observables, Interact, CSSUtil, WebIO, Markdown
using Observables: @map

const PORT = parse(Int64, ARGS[1])

#-----------------------------------------------------------------------# ui
x1 = slider(1:50) |> onchange
x1out = @map "The slider's value is $(&x1)"


x2 = checkboxes(1:5)
x2out = @map "You have checked: $(&x2)"

ui = vbox(
    md"""
    # Welcome to a tour of [Interact.jl](https://github.com/JuliaGizmos/Interact.jl)!
    """,

    md"""
    ## Sliders
    """,
    x1, x1out,

    md"""
    ## Checkboxes
    """,
    x2, x2out,
)

#-----------------------------------------------------------------------# Run Server
WebIO.webio_serve(page("/", req -> ui), PORT)