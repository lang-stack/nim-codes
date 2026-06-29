var
    letters: set[char] = {'a', 'b', 'c'}
    digits = {'1', '2', '3'}

letters.incl('d')
letters.excl('a')

echo letters, digits

var
    s1 = {1, 2, 3}
    s2 = {3, 4, 5, 6}

echo s1 + s2   # union
echo s1 * s2   # intersection
echo s1 - s2   # difference
echo s1 == s2  # equality

echo s1.card()

type Color = enum red, green, blue, yellow
var primary: set[Color] = {red, green, blue}
primary.incl(yellow)

echo yellow in primary