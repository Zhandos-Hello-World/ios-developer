import UIKit

//1) Task
print("1)------------------------------------------------------")
protocol Operation: CustomStringConvertible {
    func findable() -> Bool
    func operand() -> Int
    
}
class Addition: Operation {
    var value: Int
    var target: Int
    
    init(value: Int, target: Int) {
        self.value = value
        self.target = target
    }
    
    
    public func findable() -> Bool {
        return self.target - self.value >= 0
    }
    public func operand() -> Int {
        return self.target - self.value
    }
    
    public var description: String {
        if (findable()) {
            return "Addition: \(value) + \(operand()) = \(target)"
        }
        else {
            return "Addition: Impossible"
        }
    }
}
class Subtraction: Operation {
    var value: Int
    var target: Int
    
    init(value: Int, target: Int) {
        self.value = value
        self.target = target
    }
    public func findable() -> Bool {
        return self.target - self.value <= 0
    }
    public func operand() -> Int {
        return -(self.target - self.value)
    }
    
    public var description: String {
        if (findable()) {
            return "Subtraction: \(value) - \(operand()) = \(target)"
        }
        else {
            return "Subtraction: Impossible"
        }
    }
    
    
}
class Multiplication: Operation {
    var value: Int
    var target: Int
    
    init(value: Int, target: Int) {
        self.value = value
        self.target = target
    }
    
    public func findable() -> Bool {
        return self.target / self.value != 0
    }
    public func operand() -> Int {
        return self.target / self.value
    }
    
    public var description: String {
        if (findable()) {
            return "Multiplication: \(value) * \(operand()) = \(target)"
        }
        else {
            return "Multiplication: Impossible"
        }
    }
    
}
class Division: Operation {
    var value: Int
    var target: Int
    
    init(value: Int, target: Int) {
        self.value = value
        self.target = target
    }
    public func findable() -> Bool {
        return self.value / self.target != 0
    }
    public func operand() -> Int {
        return self.value / self.target
    }
    
    public var description: String {
        if (findable()) {
            return "Division: \(value) / \(operand()) = \(target)"
        }
        else {
            return "Division: Impossible"
        }
    }
}
var value = 10
let target = 2
let operations: [Operation] = [Addition(value: value, target: target), Subtraction(value: value, target: target), Multiplication(value: value, target: target), Division(value: value, target: target), Division(value: value, target: target)]

for i in operations {
    print(i)
}

print("2)------------------------------------------------------")
enum Auth {
    case login
    case google
    case facebook
}
class User: CustomStringConvertible  {
    var name: String
    var lastName: String
    var age: Int
    var phone: String
    var loginType: Login
    
    init(name: String, lastName: String, age: Int, phone: String, username: String, password: String) {
        self.name = name
        self.lastName = lastName
        self.age = age
        self.phone = phone
        self.loginType = ClassicStyle(username: username, password: password)
    }
    convenience init(login: Login) {
        if (login is Google) {
            let temp = login as! Google
            self.init(name: temp.name, lastName: temp.lastName, age: temp.age, phone: temp.phone, username: temp.username, password: temp.password)
        }
        else if (login is Facebook) {
            let temp = login as! Facebook
            self.init(name: temp.name, lastName: temp.lastName, age: temp.age, phone: temp.phone, username: temp.username, password: temp.password)
        }
        else {
            let temp = login as! ClassicStyle
            self.init(name: "Unknown", lastName:"Unknown", age: -1, phone: "Unkown", username: temp.username, password: temp.password)
        }
        self.loginType = login
    }
    public var description: String {
        return "------------------User----------------\nname: \(name)\nlastname: \(lastName)\nage: \(age)\nphone\(phone)\n \(loginType)"
    }
}

protocol Login: CustomStringConvertible {
    func typeOf() -> Auth
}

class ClassicStyle: Login  {
    var username: String
    var password: String
    var type: Auth {get { return Auth.login} }
    
    public init(username: String, password: String) {
        self.username = username
        self.password = password
    }
    func typeOf() -> Auth {
        return .login
    }
    public var description: String {
        return "via ClassicStyle(username: \(username), password:\(password))"
    }
}
class Facebook: ClassicStyle {
    var name: String
    var lastName: String
    var age: Int
    var phone: String
    override var type: Auth {get { return Auth.facebook} }
    
    init(username: String, password: String, name: String, lastName: String, age: Int, phone: String) {
        self.name = name
        self.lastName = lastName
        self.age = age
        self.phone = phone
        super.init(username: username, password: lastName)
    }
    override func typeOf() -> Auth {
        return .facebook
    }
    override var description: String {
        return "via Facebook(username: \(username), password\(password))"
    }
    
}
class Google: ClassicStyle {
    var name: String
    var lastName: String
    var age: Int
    var phone: String
    override var type: Auth {get { return Auth.google} }

    init(username: String, password: String, name: String, lastName: String, age: Int, phone: String) {
        self.name = name
        self.lastName = lastName
        self.age = age
        self.phone = phone
        super.init(username: username, password: password)
    }
    override func typeOf() -> Auth {
        return .google
    }
    override var description: String {
        return "via Google(username: \(username), password\(password))"
    }
}
class Service {
    var user: User
    
    init(user: User) {
        self.user = user
    }
    convenience init(name: String, lastName: String, age: Int, phone: String, username: String, password: String) {
        self.init(user: User(name: name, lastName: lastName, age: age, phone: phone, username: username, password: password))
    }
    init(login: Login) {
        self.user = User(login: login)
    }
    
    func getInformation() {
        let authType: Auth = user.loginType.typeOf()
        switch authType {
            case .login: print("Login as ClassicStyle")
            case .facebook: print("Login as Facebook")
            case .google: print("Login as Google")
        }
    }
}

var facebookUser = Facebook(username: "Zhandos123", password: "1234567", name: "Zhandos", lastName: "Baimurat", age: 19, phone: "+87767773954")

//We need to get connect this facebook to like our user
var user = User(login: facebookUser)
print(user)
var service = Service(user: user)
service.getInformation()


//3- task
print("3)------------------------------------------------------")
protocol Product {
    var id: Int { get set }
    var name: String { get set }
    var manufacturer: String { get set }
    var price: Int { get set }
}
struct ProductItem: Product {
    var id: Int
    var name: String
    var manufacturer: String
    var price: Int
}
class Transportation {
    var items: [String] = ["Macbook", "Iphone X", "Iphone 13", "Samsung Galaxy S10", "Samsung Galaxy S20",
    "Samsung Galaxy S21", "Playstation 5", "Playstating 4", "Xbox 360", "Xbox One", "Huawei P9 Lite Mini"]
    var countries: [String] = ["USA", "Canada", "China", "Russia", "Kazakhstan", "Hong kong"]
    var money = 10_0000
    var itemsCountMoney = 0
    
    func generate(num: Int) -> [ProductItem] {
        var item: [ProductItem] = []
        for i in 0..<num {
            let itemPrice = Int.random(in: 10_000...100_0000)
            itemsCountMoney += itemPrice
            let product = ProductItem(id: i, name: items.randomElement()!, manufacturer: countries.randomElement()!, price: itemPrice)
            item.append(product)
        }
        return item
    }
}
enum ShopError: Error {
    case noMoney
    case noItem
}
class Shop {
    private var money: Int = 5_000_000
    var items: [ProductItem] = []
    private var transport = Transportation()
    

    init() throws {
        try getItems()
    }
    
    
    
    private func getItems() throws {

        items = transport.generate(num: 50)
        if (money < transport.itemsCountMoney) {
            throw ShopError.noMoney
        }
        let current_money = transport.itemsCountMoney
        money -= current_money
        transport.money += current_money
        transport.itemsCountMoney = 0
    }
    func giveProducts(cash: Cash, itemsNum: Int) throws {
        if itemsNum > items.count {
            throw ShopError.noItem
        }
        cash.items = items
    }
    
}


class Cash {
    private var money: Int = 10_000
    var items: [ProductItem] = []
    private var shop: Shop
    
    init() throws {
        try shop = Shop()
    }
    
    
    func getItems(itemsNum: Int) throws {
        try shop.giveProducts(cash: self, itemsNum: itemsNum)
    }
    
}
