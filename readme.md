# NIM Programming
## Hello World

```nim
when isMainModule:
    echo("Hello World")
```

```nim
echo "Hello World"
```

```nim
var name = "Tanjiro"
echo "Hello ", name, "!"
```

## Increment

We can use `inc` to increment the variable.

```nim
var hello:int = 10
echo "Before Increment ", hello
inc hello
echo "After Increment ", hello
```

This is equivalent to `hello++`

## Variables

### var

- `var` is mutable.
- Once declared, we can change the value of variable.

### const

- `const` is immutable.
- Once declared, we cannot change the value.
- Value should be assigned at the time of variable declaration.

### let

- `let` is immutable.
- Once the value is assigned, we cannot change it.
- We can assign the value after empty declaration.

```nim
let name: string
name = "Tanjiro"
```


## Types

```nim
type Animal* = object
    name*, species*: string

when isMainModule:
    let cat = Animal(name: "Garfield", species: "Cat")
    echo cat.name
```

If we try to change `cat.name`, we can't because `let` is immutable. If it is `var`, we can change it.

## DataTypes

```nim
when isMainModule:
    var
        i: int = 42
        f: float = 24.2
        d: float64 = 24.2222
        b: int8 = 120
        u: uint = 100u

    var isAwesome: bool = true
    var c: char = 'A'
    var s: string = "Hello, Nim"
    var nums: seq[int] = @[1, 2, 3, 4, 5, 12938]
    var fixed_arr: array[3, string] = ["red", "green", "blue"]
    var person: tuple[name: string, age: int] = (name: "Alice", age: 25)
    var letters: set[char] = {'a', 'e', 'i', 'o', 'u'}
    
    type
        Color = enum
            Red,
            Green,
            Blue

    var fav_color: Color = Green

    echo i
    echo f
    echo d
    echo b
    echo u
    echo s
    echo isAwesome
    echo nums
    echo fixed_arr
    echo person
    echo letters
    echo fav_color
```

## Operators

```nim
# +, -, *, /
# div
# mod
# ^ (power)

# ==
# !=
# <
# >
# <=
# >=

# and
# or
# not
# xor

# shl
# shr
# and
# xor
# not

# =
# +=
# -=
# *=
# /=
# div=
# mod=

# &
# in (if 'a' in "cat")
# notin

# ..
# []
# []=
# not notin
# [], ()

type Vector = object
    x, y: float

proc `+`(a, b: Vector): Vector = Vector(x: a.x + b.x, y: a.y + b.y)

echo Vector(x:1, y:2) + Vector(x:3, y:4)
```

## Conditionals

- `when` runs on compile time.
- We can use nested `when`.

### if-else conditions

```nim
let x = 10

if x > 0:
    echo "Positive"
elif x == 0:
    echo "Zero"
else:
    echo "Negative"
```

### Ternary operators

```nim
# Ternary operator
let y = 0
let sign = if y > 0 : "Positive" elif y == 0 : "Zero" else: "Negative"
echo sign
```

### When

```nim
# When
when defined(windows):
    echo "Running on windows"
elif defined(linux):
    echo "Running on linux"
else:
    echo "Other platforms"
```

### Case

```nim
let day = "Sat"
case day
of "Mon":
    echo "Start of week"
of "Tue", "Wed", "Thu":
    echo "Midweek"
else:
    echo "Some other day"
```


## Loops

### for

Display from 1 to 5

```nim
for i in 1..5:
    echo i
```

```nim
let names = ["Alice", "Bob", "Charlie"]
for name in names:
    echo name
```

#### countup

```nim
for i in countup(1, 10, 2):
    echo i
```

**Output**

```
1, 3, 5, 7, 9
```

### while

```nim
var i = 0
while i < 5:
    echo i
    inc i
```

**Output**

```
0, 1, 2, 3, 4
```

- We can skip the loop using `continue`
- We can break using `break`

## Blocks

```nim
block outer:
    for i in 1..5:
        if i  == 3:
            break outer
        echo i
```

- This is useful for escaping multiple nested loops and conditions.

## Exception Handling

```nim
import strutils

try:
    let x = parseInt("abc")
    echo x
except ValueError:
    echo "Invalid Number"
except:
    echo "Some other exception"
finally:
    echo "Finally executed"
```

- `finally` always executed last.

```nim
raise newException(ValueError, "Some bad thing happened here for some reason")
```

- We can raise new errors using `raise` keyword.

```
static:
    echo "Hello"
```

- `static` will run at compile time. So "Hello" will be printed at the time of compilation, not runtime.

## File Handling

```nim
import strutils

proc demo() =
    var f = open("data.txt", fmWrite)
    defer: f.close()
    f.writeLine("Some text")

demo()
```

- `defer` will run the code at the end.

## Functions

```nim
func square*(x: int): int = x * x

func fact(n: int): int =
    if n <= 1: 1 else: n * fact(n - 1)

func isEven*(n: int): bool = (n mod 2) == 0

echo square(6)
echo fact(5)
echo isEven(3)
```

- Functions cannot mutate its arguments.
- Functions can't allow mutating global variables.

```nim
func applyTwice(f: proc(i: int): int {.noSideEffect.}, x:int): int =
    f(f(x))

func increment(x: int): int = x + 1

echo applyTwice(increment, 5);

func sum(xs: seq[int]): int = foldl(xs, a+b, 0)

let data = @[1, 2, 3, 4]
let squares = map(data, square)
let total = sum(squares)

echo (squares, total)
```

## Procedures

- In Nim, `proc` is a general purpose routine keyword.
- A `proc` may return a value, may return nothing and it can have side effects unlike functions.

```nim
proc sayHello() =
    echo "This is a greeting"
```

```nim
proc add(x, y: int): int = x + y
```

```nim
proc greet(name: string = "world", punctuation: string = "!") =
    echo "Hello ", name, punctuation

greet()
greet("Tanjiro", "!!")

# Using named parameters
greet(punctuation="?")
```

```nim
proc increment(x: var int) =
    x += 1

var n = 5
increment(n)
echo n  # n will be 6
```

Procedures can also return multiple values

```nim
proc divmod(a, b: int): (int, int) =
    (a div b, a mod b)

let (q, r) = divmod(10, 3)
echo "Quotient : ", q, ", Remainder : ", r
```

We can use multiple procedures with same name with different datatypes. It will execute based on the datatype of param.

```nim
proc show(x: int) = echo "Int: ", x
proc show(x: float) = echo "Float: ", x
proc show(s: string) = echo "String: ", s

show("Hello")
```

```nim
proc swap[T](a, b: var T) =
    let temp = a
    a = b
    b = temp

var x = 10
var y = 20
swap(x, y)

echo x, " ", y
```

We can pass n number of parasters to proc using `varargs`

```nim
proc getSum(nums: varargs[int]): int =
    for n in nums:
        result += n

echo getSum(123, 125, 5)  # It will return 253
```

We can define procedures without side effects

```nim
proc square(x: int): int {.noSideEffect.} = x * x
```

```nim
proc even(n: int): bool
proc odd(n: int): bool

proc even(n: int): bool =
    if n == 0: true
    else: odd(n - 1)

proc odd(n: int): bool =
    if n == 0: false
    else: even(n - 1)

echo even(10), " ", odd(5)
```

We can even use nested procedures

```nim
proc outerProc() =
    proc innerProc() =
        echo "Inside inner proc"
    innerProc()

outerProc()
```

##### Public and Private procedures

To define exported procedures or functions, we should add `*` after function name.

```nim
proc square*(x: int): int = x * x
```

This means, `square` can be imported. We can import the file into another file, and use the function there. Without `*`, it will be private function which will be used only inside the file.

##### Returning values

Every procedure with a return type automatically has a variable named `result`.

```nim
proc square(x: int): int =
    result = x * x

echo square(5)  # 25
```

We can also use the `return` statement to explicitly return a value or to exit procedure early.

```nim
proc square(x: int): int =
    return x * x
```

We can also assign the return value to the procedure's name.

```nim
proc square(x: int): int =
    square = x * x
```

This works, but not preferred more.

##### Difference between Procedures and Functions

In NIM, there is no seperate function keyword like any other language. The main callable unit is procedure.

NIM also procides `func` keyword, but this is a restricted kind of procedure.

A `func` is expected to be pure, meaning it should not have side effects.

By side effects, a function can't print and do any other operation other than calculate and return the result. 

But procedures can do anything like print messages, modify things etc.

These are called side effects.

## Unit Testing

- We can also automate test runs using **nimble** when we initialize nimble project using:

```bash
nimble init
```

The above command will generate the Nim project. Inside the project, the structure should be

```
src/
tests/
basics.nimble
```

In basics.nimble file, add:

```nim
task test, "Run all unit tests":
    exec "nimble c -r tests/test1.nim"
```

Then run:

```bash
nimble test
```

It will execute tests from `tests/test1.nim`.

Otherwise, we can write and execute test cases manually by importing `unittest` module.

```nim
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
```


## I/O and Common Stream Handling

### Reading user input

```nim
echo "Enter name:"
let name = readLine(stdin)

echo "Hello, ", name
```

### File operations

#### Writing to a file

```nim
import os

let filename = "data.txt"
let content = "This is a line written to a file."

let f = open(filename, fmWrite)
f.writeLine(content)
f.close()
```

- We should import `os` module for file operations.

#### Reading from a file

```nim
import os

let filename = "data.txt"

let f = open(filename, fmRead)

for line in f.lines:
    echo line

f.close()
```

#### Using FileStream

```nim
import streams

var fs = newFileStream("data.txt", fmRead)

if fs != nil:
    echo fs.readAll()
    fs.close()
else:
    echo "Couldn't open file"
```

- To use FileStream, we should import `streams` module.

#### Copy file contents using FileStream

```nim
import streams

let input = newFileStream("data.txt", fmRead)
let output = newFileStream("file.txt", fmWrite)

if input != nil and output != nil:
    const bufferSize = 1024
    var buffer = newString(bufferSize)
    var bytesRead: int

    while true:
        bytesRead = input.readData(addr buffer[0], bufferSize)
        if bytesRead == 0: break
        output.writeData(addr buffer[0], bytesRead)

    input.close()
    output.close()
else:
    echo "Error opening files."
```


## Sequences, Array and Tuples

### Arrays

- Arrays are fixed size.
- If we add more items than defined side, we will get error at compile time.

```nim
var a: array[3, int] = [1, 2, 3]

echo a[0]

for i, v in a:
    echo i, v
```

### Sequences

```nim
var seq1: seq[int] = @[1, 2, 3]
seq1.add(4)

echo seq1

for s in seq1:
    echo s
```

- Sequence can be changed in side, we can add, delete and do anything.
- They are not fixed size and can be mutable.

##### Insert

```nim
seq1.insert(2, 1)
```

- It will insert `2` in position `1`.

##### Delete

```nim
seq1.delete(1)
```

- It will delete item from position `1`.

##### Length

```nim
echo seq1.len
```

### Tuples

- These are fixed size collection.
- Can hold multiple types.
- Can hold both named and unnamed fields.
- Mutable if declared with `var`

```nim
let person = ("Alice", 30)

echo person[0]
echo person[1]
```

We can defied named Tuples

```nim
type Person = tuple[name: string, age: int]
let p:Person = (name: "Bob", age: 50)

echo p
```

We can also define procedures return Tuples

```nim
proc divide(a, b:int): (int, int) =
    (a div b, a mod b)

echo divide(10, 5)
```

```nim
let (q, r) = divide(10, 3)

echo "Quotient: ", q
echo "Remainder: ", r
```

## Sets & Tables

### Sets

- Set is an unordered collection of unique values.
- We can add items to set using `incl` method.
- Sets won't allow duplicated. If we try to add duplicates, it will just ignore and display unique values.
- We can also remove items from set using `excl` method.

```nim
var
    letters: set[char] = {'a', 'b', 'c'}
    digits = {'1', '2', '3'}

letters.incl('d')
letters.excl('a')

echo letters, digits
```

Set operations

```nim
var
    s1 = {1, 2, 3}
    s2 = {3, 4, 5, 6}

echo s1 + s2   # union
echo s1 * s2   # intersection
echo s1 - s2   # difference
echo s1 == s2  # equality
```

To check the length of the set

```nim
echo s1.card()
```

Enums in sets

```nim
type Color = enum red, green, blue, yellow

var primary: set[Color] = {red, green, blue}
primary.incl(yellow)

echo yellow in primary
```

### Table

- Key - value store like dictionary.
- Key must be hashable.
- To use tables, we must import `std/tables` module.

```nim
import std/tables

var capitals = initTable[string, string]()
capitals["France"] = "Paris"
capitals["Japan"] = "Tokyo"

echo capitals["Japan"]
echo "Japan" in capitals
echo capitals.len

for country, capital in capitals:
    echo country, " -> ", capital
```

We can add items to table.

```nim
capitals["Norway"] = "Oslo"
```

To check if the table contains a key

```nim
echo capitals.contains("Norway")
```

To delete an item from table

```nim
capitals.del("Norway")
```

We can use `getOrDefault` method to return default value if item not exist in the table.

```nim
echo capitals.getOrDefault("Spain", "Unknown")
```

We can count repititions using `initCountTable`. It will automatically count occurances of the elements.

```nim
import std/tables
import std/strutils
```

```nim
let text = "nim is fast and nim is fun"
var wordCount = initCountTable[string]()

for w in text.splitWhiteSpace():
    wordCount.inc(w)

for word, count in wordCount:
    echo word, ": ", count
```

```nim
var c = initCountTable[string]()

c.inc("apple")
c.inc("apple")
c.inc("banana")

echo c["apple"]
echo c["banana"]
```

We can use `initOrderedTable` to define elements in the same order as they defined.

```nim
var t = initOrderedTable[int, string]()

t[2] = "B"
t[1] = "A"
t[3] = "C"

for k, v in t:
    echo k, " -> ", v
```

## Iterators & Ranges

### Iterators

- Iterators in NIM is a special procedures that yields values one at a time.
- Similat to generators in Python.

```nim
iterator countUpTo(n: int): int =
    for i in 1..n:
        yield i

iterator evenNumbers(limit: int): int =
    var i = 0
    while i <= limit:
        yield i
        i += 2

for x in countUpTo(5):
    echo x

for e in evenNumbers(10):
    echo e
```



Multiple `yield` values.

```nim
iterator fizzBuzz(n: int): string =
    for i in 1..n:
        if i mod 15 == 0:
            yield "FizzBuzz"
        elif i mod 3 == 0:
            yield "Fizz"
        elif i mod 5 == 0:
            yield "Buzz"
        else:
            yield $i

for val in fizzBuzz(15):
    echo val
```

Infinite loops

```nim
iterator naturals(): int =
    var i = 0
    while true:
        yield i
        inc i

for n in naturals():
    if n > 5: break
    echo n
```

We can also pass iterators as parameters

```nim
iterator squares(n: int): int =
    for i in 1..n:
        yield i * i

proc consume(it: iterator(): int) =
    for x in it():
        echo x
```

### Ranges

```nim
var x: range[1..10]
x = 5

echo x
```

- `x` can only be between 1 to 10. If we define 11, it will throw error at compile time.

We can also use it in iterations

```nim
for i in 1..5:
    echo i
```

We can also use it to display slice of list

```nim
let numbers = @[1, 2, 3, 4, 5]
echo numbers[1..3]
```

- It will display `[2, 3, 4]`, from index 1 to 3 items.

We can also mix ranges and iterators

```nim
iterator squaresInRange(r: HSlice[int, int]): int =
    for i in r:
        yield i * i

for sq in squaresInRange(3..6):
    echo sq
```

## String Handling

We can concat strings using `&`

```nim
var a = "Hello"
var b = "World"

let c = a & b
echo c
```

- We can concat multiple number of strings like this.

We can also use indexing from strings.

```nim
# Get first character from string
echo a[0]

# Get last character from string
echo a[^1]

# Get characters from range
echo a[1..3]  # Will print ell

# Get characters less than range
echo a[1..<3]  # Will print el
```

We can also loop through strings.

```nim
for ch in "Nim":
    echo ch
```

We can change and add to mutable strings.

```nim
var s = "Hello"
s[0] = 'h'
s.add(" world")

echo s
```

We can also do string interpolation. To do that, we need to import `strformat` library.

```nim
import strformat

let name = "Bob"
let score = 42

echo &"Player {name} scored {score}"
```

We can also cast strings to other types. using `strutils` library.

```nim
import strutils

let x = parseInt("123")
let y = parseFloat("3.14")

echo x, ", ", y
```

Other things we can do using `strutils` library.

```nim
import strutils

let t = " Nim is okay "

# Strip whitespaces
echo t.strip()

# To lower case
echo t.toLowerAscii()

# To upper case
echo t.toUpperAscii()

# Split as array
echo "a,b,c".split(",")

# Seperate strings
echo "abc".join("-")  # Will return as a-b-c

# Check if string starts with space
echo t.startsWith(" ")

# Check if string ends with space
echo t.endsWith(" ")
```

We can also find and replace strings.

```nim
let f = "the quick brown fox"

# Find the index
echo f.find("quick")

# Check if strings contains the substring
echo f.contains("fox")

# Replace string with another
echo f.replace("brown", "red")
```

We can also write multi-line strings.

```nim
let m = """
This is a
multi line
string
"""

echo m
```

We can slo add to strings using buffers.

```nim
var buff = ""
for i in 0..3:
    buff.add($i)
    buff.add(" ")

echo buff
```

We can also add strings using string builders.

```nim
import strformat

var sb = newStringOfCap(128)
sb.add("Hello")
sb.add(" World")

echo sb
```

