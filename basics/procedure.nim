proc sayHello() =
    echo "This is a greeting"

proc add(x, y: int): int = x + y

sayHello()
echo add(1, 2)

proc greet(name: string = "world", punctuation: string = "!") = 
    echo "Hello ", name, punctuation

greet()
greet("Tanjiro", "!!")

# Using named parameters
greet(punctuation="?")

proc increment(x: var int) = 
    x += 1

var n = 5
increment(n)
echo n

proc divmod(a, b: int): (int, int) = 
    (a div b, a mod b)

let (q, r) = divmod(10, 3)
echo "Quotient : ", q, ", Remainder : ", r

proc show(x: int) = echo "Int: ", x
proc show(x: float) = echo "Float: ", x
proc show(s: string) = echo "String: ", s

show("Hello")

proc swap[T](a, b: var T) = 
    let temp = a
    a = b
    b = temp

var x = 10
var y = 20
swap(x, y)
echo x, " ", y

proc getSum(nums: varargs[int]): int = 
    for n in nums:
        result += n
    
echo getSum(123, 125, 5)

proc square(x: int): int {.noSideEffect.} = x * x

proc even(n: int): bool
proc odd(n: int): bool

proc even(n: int): bool = 
    if n == 0: true
    else: odd(n - 1)

proc odd(n: int): bool = 
    if n == 0: false
    else: even(n - 1)

echo even(10), " ", odd(5)

proc outerProc() = 
    proc innerProc() = 
        echo "Inside inner proc"
    innerProc()

outerProc()