import strutils, sequtils

# 4 5 +
proc evalRpn(tokens: seq[string]): float =
    var stack: seq[float] = @[]

    for token in tokens:
        case token
        of "+", "-", "*", "/" :
            if(stack.len < 2):
                raise newException(ValueError, "Not enough operands for " & token)

            let b = stack.pop()
            let a = stack.pop()
            let result = case token
                of "+": a + b
                of "-": a - b
                of "*": a * b
                of "/": a / b
                else: 0

            stack.add(result)
        else:
            try:
                stack.add(parseFloat(token))
            except ValueError:
                raise newException(ValueError, "Bad Expression")

    return stack[0]


when isMainModule:
    while true:
        stdout.write("> ")
        let line = stdin.readLine().strip()
        if line == "" or line == "quit": break

        let tokens = line.splitWhitespace()
        try :
            let result = evalRpn(tokens)
            echo "Result: ", result
        except ValueError as e:
            echo "Error: ", e.msg