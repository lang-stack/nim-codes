var seq1: seq[int] = @[1, 2, 3]
seq1.add(4)
seq1.insert(2, 1)
seq1.delete(1)

echo seq1
echo seq1.len

for s in seq1:
    echo s