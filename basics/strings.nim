import strformat, strutils, unicode

var a = "Hello"
var b = "World"

let c = a & b
echo c

echo a[0]
echo a[^1]
echo a[1..3]
echo a[1..<3]

for ch in "Nim":
    echo ch

for i, ch in "Nim":
    echo i, " -> ", ch

var s = "Hello"
s[0] = 'h'
s.add(" world")

echo s

let name = "Bob"
let score = 42

echo &"Player {name} scored {score}"

let x = parseInt("123")
let y = parseFloat("3.14")

echo x, ", ", y

let t = " Nim is okay "

# Strip whitespaces
echo t.strip()

# To lower case
echo t.toLowerAscii()

# To upper case
echo t.toUpperAscii()

# Split as list
echo "a,b,c".split(",")

# Seperate strings
echo "abc".join("-")  # Will return as a-b-c

# Check if string starts with space
echo t.startsWith(" ")

# Check if string ends with space
echo t.endsWith(" ")

let f = "the quick brown fox"

# Find the index
echo f.find("quick")

# Check if strings contains the substring
echo f.contains("fox")

# Replace string with another
echo f.replace("brown", "red")

let m = """
This is a
multi line
string
"""

echo m

