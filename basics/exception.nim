import strutils

when isMainModule:
    discard

static:
    echo "Hello"

try:
    let x = parseInt("abc")
    echo x
except ValueError:
    echo "Invalid Number"
except:
    echo "Some other exception"
finally:
    echo "Finally executed"
    raise newException(ValueError, "Some bad thing happened here for some reason")