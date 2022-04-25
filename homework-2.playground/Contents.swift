import UIKit

//1
print("1) --------------------------")
print("     /\\")
print("    /  \\")
print("   /    \\")
print("  /      \\")
print(" /        \\")
print(" - -    - -")
print("    |  |")
print("-------------")


//2
print("2) --------------------------")
var value = 1
while value <= 150 {
    if value % 3 == 0 && value <= 99 {
        print(value)
    }
    value += 1
}


//3
print("3) --------------------------")
var value2 = 1
while value2 <= 150 {
    if value2 % 7 == 0 && value2 % 2 != 0 && value2 <= 99 {
        print(value2)
    }
    value2 += 1
}





