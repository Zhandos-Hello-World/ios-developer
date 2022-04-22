import UIKit

//Task - 1
print("1) -------------------------")
var arr = ["+", "-", "*", "/"]

func operation(_ value: inout Int, _ target: Int, _ oper: String) {
    switch (oper) {
        case "+": value += target
        case "-": value -= target
        case "*": value *= target
        case "/": value /= target
        default: print("Error")
    }
}


var value = 10
let target = 2
for i in arr {
    operation(&value, target, i)
}
print(value)


//Task - 2
print("2) -------------------------")
var list: [Int] = [1, 5, 6, 7, 9, 54, 87, 67, 5, 45, 8]
var result: [String] = []

var closure = {(a: Int) -> String in "\(a)"}
for i in list {
    result.append(closure(i))
}
print(result)


//Task - 3
func fibonaci(_ value: Int) -> Int {
    if (value > 0) {
        return value * fibonaci(value - 1)
    }
    return 1
}

var r = 5
print("3) -------------------------")
print(fibonaci(r))



