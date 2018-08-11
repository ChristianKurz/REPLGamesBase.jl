*This documentation is a work in progress.*

# REPLGamesBase

This package aims to be a good base to develop simple games for the REPL.
It offers simple key input grabbing and Unicode-canvas rendering.

This is an incomplete description of the API:
* `rawmode(f::function)` - switches the terminal to raw mode to allow for color- and cursor-movement-codes. also hides the cursor. Returns to normal mode after `f` returns. Recommend usage is `rawmode() do ... end`.
* `clearscreen()` - clears the last 50 lines of REPL-output
* `readKey()` - reads a key-input. Should be used like this: `readKey() in ["Up"] && do_something()`
* `put(str, [color], pos)` put any string starting at the specified postion, colored by crayon