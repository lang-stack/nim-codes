import std/times

let time = now()
echo time
echo time.format("yyyy-MM-dd")

let time2 = now().utc
echo time2

let time3 = getTime()
echo time3