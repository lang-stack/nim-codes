# Package

version       = "0.1.0"
author        = "Bhaswanth Chiruthanuru"
description   = "A new awesome nimble package"
license       = "MIT"
srcDir        = "src"


task test, "Run all unit tests":
    exec "nimble c -r tests/test1.nim"

# Dependencies

requires "nim >= 2.2.10"
