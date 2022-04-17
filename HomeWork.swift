//1
print("1----------------")
for i in 1...100{
    var value = true
    if (i > 2) {
        for j in 2..<i {
            if i % j == 0 {
                value = false
                break
            }
        }
    }
    if (value) {
        print(i)
    }
}
print("2)------------------")
var array = [0, 6, 2, 0, 0, 4, 5, 3, 3, 6, 0, 7, 9, 4, 5, 0, 5, 7, 0, 0]
var i = 0, j = array.count - 1
while i < j {
    var temp = array[i]
    array[i] = array[j]
    array[j] = temp
    i += 1
    j -= 1
}
print(array)


print("3)-------------------")
array = [0, 6, 2, 0, 0, 4, 5, 3, 3, 6, 0, 7, 9, 4, 5, 0, 5, 7, 0, 0]
    //time complexity O(n)
    //Firstly, I found index which is not contain zero
i = 0
var num = 0
while num < array.count {
    if (array[num] != 0) {
        i = num
        break
    }
    num += 1
}
//Secondly, My j will be find zero and if it found zero, then my array[i] will be exchange with my array[j].
j = i
while j < array.count {
    if (array[j] == 0) {
        var temp = array[j]
        array[j] = array[i]
        array[i] = temp
        i += 1
    }
    j += 1
}
//Finally, we get array
print(array)

print("4-----------------")
array = [0, 6, 2, 0, 0, 4, 5, 3, 3, 6, 0, 7, 9, 4, 5, 0, 5, 7, 0, 0]
var map: [Int: Int] = [:]
//map[i] = 2
for i in array {
    map[i] = (map[i] ?? 0) + 1
}
var mapFilter: [Int: Int] = [:]
var values: [Int] = []
for i in map.values {
    values.append(i)
}
var keys: [Int] = []
for i in map.keys {
    keys.append(i)
}

var check = true
while check {
    check = false
    var i = 1, j = 0
    while (i < keys.count){
        if values[j] < values[i] {
            var temp = keys[i]
            keys[i] = keys[j]
            keys[j] = temp
            
            var temp2 = values[i]
            values[i] = values[j]
            values[j] = temp2
            
            check = true
        }
        i += 1
        j += 1
    }
}
i = 0
while i < keys.count {
    print("\(keys[i]) встречается \(values[i]) раз")
    i += 1
}








