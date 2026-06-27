# +, -, *, /
# div
# mod
# ^ (power)

# ==
# !=
# <
# >
# <=
# >=

# and
# or
# not
# xor

# shl
# shr
# and
# xor
# not

# =
# +=
# -=
# *=
# /=
# div=
# mod=

# &
# in (if 'a' in "cat")
# notin

# ..
# []
# []=
# not notin

# [], ()

type Vector = object
    x, y: float

proc `+`(a, b: Vector): Vector = Vector(x: a.x + b.x, y: a.y + b.y)

echo Vector(x:1, y:2) + Vector(x:3, y:4)