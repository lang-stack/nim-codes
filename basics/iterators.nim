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

iterator naturals(): int =
    var i = 0
    while true:
        yield i
        inc i

for n in naturals():
    if n > 5: break
    echo n

iterator squares(n: int): int =
    for i in 1..n:
        yield i * i

proc consume(it: iterator(): int) =
    for x in it():
        echo x