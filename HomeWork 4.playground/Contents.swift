//1

import Foundation
print("1-----------------")
var array: [Any?] = [0, nil, "String", 4.5, Optional(true)]
array = array.filter({ $0 != nil})
print(array.map({$0!}))

//2
print("2-----------------")
array = ["Tom", "Jerry", 1, 2, 3, 4, 2.4, 6.5, "Garfield", true, false, false, 40.3]
array.forEach({print(type(of: $0!))})

//3
print("3-----------------")
//Given
enum Weekday: CaseIterable  {
    case Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
}
let date = 12
let day: Weekday = .Tuesday
//End

var numberDayWeek = -1
switch day {
    case .Monday: numberDayWeek = 1
    case .Tuesday: numberDayWeek = 2
    case .Wednesday: numberDayWeek = 3
    case .Thursday: numberDayWeek = 4
    case .Friday: numberDayWeek = 5
    case .Sunday: numberDayWeek = 6
    case .Saturday: numberDayWeek = 7
}


//3) a
print("3) a------------")
let targetDate = 24
var count = (targetDate - date) % 7
var n = numberDayWeek
n += count
n %= 8
switch n {
    case 1: print("\(targetDate) \(Weekday.Monday)")
    case 2: print("\(targetDate) \(Weekday.Tuesday)")
    case 3: print("\(targetDate) \(Weekday.Wednesday)")
    case 4: print("\(targetDate) \(Weekday.Thursday)")
    case 5: print("\(targetDate) \(Weekday.Friday)")
    case 6: print("\(targetDate) \(Weekday.Sunday)")
    case 7: print("\(targetDate) \(Weekday.Saturday)")
    default: print("Week")
}
print("3) b------------")
var firstDayOfMonth = 1
var n2 = date % 8
var weekday = (numberDayWeek - n2)
if weekday < 0 {
    weekday = 7 + weekday
}
switch weekday {
    case 1: print("1 \(Weekday.Monday)")
    case 2: print("1 \(Weekday.Tuesday)")
    case 3: print("1 \(Weekday.Wednesday)")
    case 4: print("1 \(Weekday.Thursday)")
    case 5: print("1 \(Weekday.Friday)")
    case 6: print("1 \(Weekday.Sunday)")
    case 7: print("1 \(Weekday.Saturday)")
    default: print("Week")
}

print("3) c------------")
var fridayDayOfMonth = date + (5 - numberDayWeek)
ßvar week = 3 - (date / 7)
fridayDayOfMonth += week * 7
print(fridayDayOfMonth)






