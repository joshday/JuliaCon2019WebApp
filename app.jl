using Mux, Interact, CSSUtil, WebIO, Plots

const PORT = parse(Int64, ARGS[1])

#-----------------------------------------------------------------------# ui
ui = @manipulate for i in 1:100
    plot(rand(i))
end

#-----------------------------------------------------------------------# Run Server
WebIO.webio_serve(page("/", req -> ui), PORT)