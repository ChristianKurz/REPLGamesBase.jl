module REPLGamesBase

using Crayons, REPL
export rawmode, clear_screen, readKey, put, terminal_screen

function __init__()
    global terminal
    terminal = REPL.Terminals.TTYTerminal(get(ENV, "TERM", Base.Sys.iswindows() ? "" : "dumb"), stdin, stdout, stderr)
end

include("rawmode.jl")
include("cursor.jl")
include("readkey.jl")

end # module
