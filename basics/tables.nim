import std/tables
import std/strutils

var capitals = initTable[string, string]()
capitals["France"] = "Paris"
capitals["Japan"] = "Tokyo"

echo capitals["Japan"]
echo "Japan" in capitals
echo capitals.len

capitals["Norway"] = "Oslo"

for country, capital in capitals:
    echo country, " -> ", capital

echo capitals.contains("Norway")

capitals.del("Norway")

echo capitals

echo capitals.getOrDefault("Spain", "Unknown")

let text = "nim is fast and nim is fun"
var wordCount = initCountTable[string]()

for w in text.splitWhiteSpace():
    wordCount.inc(w)

for word, count in wordCount:
    echo word, ": ", count

var t = initOrderedTable[int, string]()
t[2] = "B"
t[1] = "A"
t[3] = "C"

for k, v in t:
    echo k, " -> ", v

var c = initCountTable[string]()
c.inc("apple")
c.inc("apple")
c.inc("banana")

echo c["apple"]
echo c["banana"]