type Animal* = object
    name*, species*: string

when isMainModule:
    let cat = Animal(name: "Garfield", species: "Cat")
    echo cat.name