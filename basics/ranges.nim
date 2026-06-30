var x: range[1..10]
x = 5

echo x

for i in 1..5:
    echo i

let numbers = @[1, 2, 3, 4, 5]
echo numbers[1..3]

iterator squaresInRange(r: HSlice[int, int]): int =
    for i in r:
        yield i * i

for sq in squaresInRange(3..6):
    echo sq