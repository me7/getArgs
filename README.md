# getArgs
https://github.com/me7/getArgs
getArgs is a simple repo for working with command line arguments.

## install
`nimble install https://github.com/me7/getArgs@#head`

## Example
```nim
import getArgs
let args = getArgs()
echo args
echo args[1]                # access by position
echo args["-a"]             # access value by key name
if "-x" in args: echo "ok"  # loop arguments
for (k, v) in args: echo k  # args is seq[(string, string)]
echo args[1].key            # get key name by position
```
