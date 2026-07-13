type Person = object
    name: string
    age: int

var p: Person
p.name = "Andrew"
p.age = 30

echo p

let a = Person(name: "Alice", age: 30)
echo a

type Animal = ref object
    species: string
    age: int

var n = Animal(species: "Dog", age: 5)
n.age += 1
echo n.age

type Shape = ref object of RootObj
    x, y: int

type Circle = ref object of Shape
    radius: float

method area(s: Shape): float = 0
method area(c: Circle): float = 3.14 * c.radius * c.radius

var c = Circle(radius: 10)
echo area(c)

# type ShapeKind = enum skCircle, skRectangle
# type Shape = object
#     case kind: ShapeKind
#     of skCircle:
#         radius: float
#     of skRectangle:
#         width, height: float


# var s: Shape
# s = Shape(kind: skCircle, radius: 10)
# echo s.radius

# s = Shape(kind: skRectangle, width: 4, height: 6)
# echo s.width * s.height

proc celebrateBirthday(p: var Person) = 
    p.age.inc 

var j = Person(name: "John", age: 30)
celebrateBirthday(p)

echo p.age

type UserId = distinct int

var id = UserId(3)
echo int(id) + 1

type HasName = concept x
    x.name is string

type Dog = object
    name: string

proc greet(x: HasName) =
    echo "Hello ", x.name

greet Person(name: "Bob", age: 10)
greet Dog(name: "Rex")