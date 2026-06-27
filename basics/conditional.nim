let x = 10

if x > 0:
    echo "Positive"
elif x == 0:
    echo "Zero"
else:
    echo "Negative"

# Ternary operator
let y = 0
let sign = if y > 0 : "Positive" elif y == 0 : "Zero" else: "Negative"
echo sign

# When
when defined(windows):
    echo "Running on windows"
elif defined(linux):
    echo "Running on linux"
else:
    echo "Other platforms"

let day = "Sat"
case day
of "Mon":
    echo "Start of week"
of "Tue", "Wed", "Thu":
    echo "Midweek"
else:
    echo "Some other day"