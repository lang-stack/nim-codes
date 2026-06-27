import streams

let input = newFileStream("data.txt", fmRead)
let output = newFileStream("file.txt", fmWrite)

if input != nil and output != nil:
    const bufferSize = 1024
    var buffer = newString(bufferSize)
    var bytesRead: int

    while true:
        bytesRead = input.readData(addr buffer[0], bufferSize)
        if bytesRead == 0: break
        output.writeData(addr buffer[0], bytesRead)

    input.close()
    output.close()
else:
    echo "Error opening files."
