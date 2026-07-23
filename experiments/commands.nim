import std/os

let args: seq[string] = commandLineParams()

type Flag = enum 
    Star,
    Loop,
    Version,
    Help

var flags: set[Flag]
var commands: seq[string]

for i, arg in args :
    if arg == "-s" or arg == "--star" :
        flags.incl(Star)
    elif arg == "-l" or arg == "--loop" :
        flags.incl(Loop)
    elif arg == "-v" or arg == "--version" :
        flags.incl(Version)
    elif arg == "-h" or arg == "--help" :
        flags.incl(Help)
    else :
        commands.add(arg)

echo commands
echo flags

if(commands[0] == "add") :
    echo "Add command"
    if Star in flags :
        echo "Star included"
    
    if Loop in flags :
        echo "Loop included"