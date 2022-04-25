var list = [3, 4, nil, 5, 7, nil, 8, 5, 3, 3, nil, 2, 2, 2, 5]

//Task - 1
print("1)-----------------------------------")
var list2 = list.compactMap({ $0 })
print(list2)


//Task - 2
print("2)-----------------------------------")
list2 = Array(Set(list2))
print(list2)

//Task - 3
print("3)-----------------------------------")
print("Count \(list2.count)")

//Task - 4
print("4)-----------------------------------")

var array = [3, [4, 5], [7, [8, 5]], [3, [3, [2, [2], 2], 5, ]]] as [Any]
var array1: [Any] = []

func single<T>(a: [T]) -> [Any] {
    for i in a {
        if i is [Any] {
            single(a: i as! [Any])
        }
        else {
            array1.append(i)
        }
    }
    
    return array1
}

print(single(a: array))

