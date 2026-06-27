import strutils

proc demo() = 
    var f = open("data.txt", fmWrite)
    defer: f.close()
    f.writeLine("Some text")

demo()