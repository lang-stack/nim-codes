import std/tables

var capitals = initTable[string, string]()
capitals["France"] = "Paris"
capitals["Japan"] = "Tokyo"

echo capitals["Japan"]
echo "Japan" in capitals
echo capitals.len

for country, capital in capitals:
    echo country, " -> ", capital