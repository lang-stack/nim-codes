type Animal = ref object of RootObj
    name: string

type Dog = ref object of Animal
type Cat = ref object of Animal

method speak(a: Animal) =
    echo "Animal makes sound"

method speak(a: Dog) =
    echo "Woof"

method speak(a: Cat) =
    echo "Meow"

let a = Animal(name: "Unknown")
a.speak()

let animals: seq[Animal] = @[
    Dog(name: "Rex"), 
    Cat(name: "Misty")
]

for an in animals:
    an.speak()

