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