import UIKit


protocol Product {
    var id: Int { get set }
    var name: String { get set }
    var manufacturer: String { get set }
}

protocol Shop {
    /// Добавить товар в магазин, если его нет.
    /// Возвращает успешное добавление.
    mutating func add(_ product: Product)-> Bool

    /// Удалить товар по ID из магазина, если он есть.
    /// Возвращает успешное удаление.
    mutating func delete(productBy id: Int) -> Bool
    
    mutating func clear() -> Bool

    /// Вывести все продукты в магазине
    func productList() ->[Product]
    
    func findFirst10Product(name: String) -> [Product]
}



struct Sulpak: Shop {
    private var products: [Product] = []
    
    mutating func add(_ product: Product) -> Bool {
        if products.contains (where: {$0.id == product.id}) {
            return false
        }
        products.append(product)
        return true
    }
    
    mutating func delete(productBy id: Int) -> Bool {
        let check = products.contains {
            $0.id == id
        }
        products.removeAll {
            $0.id == id
        }
        return check
    }
    mutating func clear() -> Bool {
        let check = !products.isEmpty
        products.removeAll()
        return check
    }
    
    
    func productList() -> [Product] {
        return products
    }
    
    func findFirst10Product(name: String) -> [Product] {
        var temp: [Product] = []
        var items = 0
        for i in products {
            if (i.name == name) {
                temp.append(i)
                items += 1
                if (items == 10) {
                    break
                }
            }
        }
        return temp
    }
}


struct SulpakItem: Product {
    var id: Int
    var name: String
    var manufacturer: String
}


protocol Service {
    func generate(num: Int) -> [Product]
}

class ServiceSulpak: Service {
    var items: [String] = ["Macbook", "Iphone X", "Iphone 13", "Samsung Galaxy S10", "Samsung Galaxy S20",
    "Samsung Galaxy S21", "Playstation 5", "Playstating 4", "Xbox 360", "Xbox One", "Huawei P9 Lite Mini"]
    var countries: [String] = ["USA", "Canada", "China", "Russia", "Kazakhstan", "Hong kong"]
    
    func generate(num: Int) -> [Product] {
        var item: [Product] = []
        for i in 0..<num {
            let sulpak = SulpakItem(id: i, name: items.randomElement()!, manufacturer: countries.randomElement()!)
            item.append(sulpak)
        }
        return item
    }
}


let products = ServiceSulpak().generate(num: 50)
var sulpak = Sulpak()
print("\n--------------------------Product was put to Sulpak----------------------------------------------\n")
for i in products {
    print(i)
    sulpak.add(i)
}

print("\n--------------------------Specific product which we are going to remove--------------------------\n")
var product = sulpak.productList().randomElement()!
print(product)
print("\n--------------------------We need to know sulpak has this prouct, or not-------------------------\n")
for i in sulpak.findFirst10Product(name: product.name) {
    print(i)
}
print("\n--------------------------After remove Product with id \(product.id)-----------------------------\n")
sulpak.delete(productBy: product.id)
for i in sulpak.findFirst10Product(name: product.name) {
    print(i)
}
print("\n--------------------------After clear------------------------------------------------------------\n")
sulpak.clear()
for i in sulpak.findFirst10Product(name: product.name) {
    print(i)
}
