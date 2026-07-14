import macros

macro dbg(x: untyped): untyped =
    result = quote do:
        block:
            let value = `x`
            echo "dbg(", astToStr(`x`), ") = ", value
            value


let a = 10
let b = dbg(a * 3)

macro showAst(x: untyped): untyped =
    echo x.treeRepr
    result = x

showAst:
    let c = 3 + 4