let person = ("Alice", 30)

echo person[0]
echo person[1]

type Person = tuple[name: string, age: int]
let p:Person = (name: "Bob", age: 50)
echo p

proc divide(a, b:int): (int, int) =
    (a div b, a mod b)

let (q, r) = divide(10, 3)
echo "Quotient: ", q
echo "Remainder: ", r