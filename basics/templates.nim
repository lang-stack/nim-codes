template printTwice(x: untyped) =
    echo x
    echo x

printTwice("Hello World")

template makeAdder(typeName: typedesc) =
    proc add(a, b: typeName): typeName = a + b

makeAdder(int)
makeAdder(float)

echo add(5, 10)
echo add(2.5, 3.5)