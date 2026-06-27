import unittest

proc add(a, b: int): int = a + b
proc reverseStr(s: string): string = 
    result = ""
    for c in s:
        result = c & result;

proc divide(a, b: int): int = 
    if b == 0:
        raise newException(ValueError, "Division by zero")
    a div b 

suite "Math operations":
    var a, b: int
    setup:
        var a = 2
        var b = 3
    
    test "Raises valueerror on div by zero":
        expect ValueError:
            discard (divide(10, 0))

    test "Addition works":
        check add(a, b) == 5

    test "With negatives":
        check add(2, -3) == -1

suite "String utilities":
    test "Reverses correctly":
        check reverseStr("abc") == "cba"
    
    test "Reverse should fail":
        check reverseStr("abc") == "bca"