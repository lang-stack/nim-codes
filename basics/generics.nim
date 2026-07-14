proc swapVals[T](a: var T, b: var T) =
    let temp = a
    a = b
    b = temp

var x = 10
var y = 20

echo "Before swap: x = ", x, ", y = ", y
swapVals(x, y)
echo "After swap: x = ", x, ", y = ", y

var x2 = "Hello"
var y2 = "World"

echo "Before swap: x2 = ", x2, ", y2 = ", y2
swapVals(x2, y2)
echo "After swap: x2 = ", x2, ", y2 = ", y2

type Stack[T] = object
    items: seq[T]

proc push[T](s: var Stack[T], value: T) = 
    s.items.add(value)

proc pop[T](s: var Stack[T]): T =
    result = s.items[^1]
    s.items.setLen(s.items.len - 1)

var intStack: Stack[int]
push(intStack, 42)
push(intStack, 99)

echo pop(intStack)
echo pop(intStack)