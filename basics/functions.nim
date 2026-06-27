import sequtils

func square*(x: int): int = x * x

func fact(n: int): int = 
    if n <= 1: 1 else: n * fact(n - 1)

func isEven*(n: int): bool = (n mod 2) == 0

echo square(6)
echo fact(5)
echo isEven(3)

func applyTwice(f: proc(i: int): int {.noSideEffect.}, x:int): int =
    f(f(x))

func increment(x: int): int = x + 1

echo applyTwice(increment, 5);

func sum(xs: seq[int]): int = foldl(xs, a+b, 0)
let data = @[1, 2, 3, 4]
let squares = map(data, square)
let total = sum(squares)

echo (squares, total)