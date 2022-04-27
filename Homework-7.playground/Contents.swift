import UIKit
import Foundation

//Task - 1
print("1)----------------------------")
protocol Shape {
    func area() -> Double
}

struct Rectangle : Shape {
    private var width: Double = 0.0
    private var heigth: Double = 0.0
    
    init(width: Double, height: Double) {
        self.heigth = height
        self.width = width
    }
    
    func area() -> Double {
        return width * heigth
    }
}

struct Circle: Shape {
    private var radius: Double = 0.0
    
    init(radius: Double) {
        self.radius = radius
    }
    func area() -> Double {
        return pow(radius, 2) * .pi
    }
}

struct Square: Shape {
    private var len: Double = 0.0
    
    init(len: Double) {
        self.len = len
    }
    
    func area() -> Double {
        return pow(len, 2)
    }
}
var shapes: [Shape] = [Rectangle(width: 12, height: 16), Circle(radius: 3.5), Square(len: 14)]

shapes.forEach {
    print("\($0.self) area is \($0.area())")
}


//Task - 2
print("2)----------------------------")
enum ConditionDevice {
    case ok
    case fixed
    case broken
}

class Device: CustomStringConvertible {
    var condition: ConditionDevice = .ok
    
    init(condition: ConditionDevice) {
        self.condition = condition
    }
    public var description: String { return "Device(\(condition))" }
}

class Monitor: Device {
    public override var description: String { return "Monitor(\(condition))" }

}

class Phone: Device {
    public override var description: String { return "Phone(\(condition))" }
}

class Camera: Device {
    public override var description: String { return "Camera(\(condition))" }
}

class Service {
    var devices: [Device] = []
    var countFixed: Int = 0
    
    init (device: Device) {
        self.devices.append(device)
    }
    init (devices: [Device]) {
        self.devices = devices
    }
    init () {
    }
    
    func addDevice(device: Device) {
        self.devices.append(device)
    }
    
    func fixDevices() {
        devices.forEach{
            if $0.condition == .broken {
                $0.condition = .fixed
                self.countFixed += 1
            }
        }
    }
}

var devices: [Device] = [Monitor(condition: .broken),
                         Phone(condition: .broken),
                         Camera(condition: .ok)]
var service = Service(devices: devices)
service.fixDevices()
print(service.devices)
print("Fixed: \(service.countFixed)")


//Task - 3
print("3)----------------------------")
enum WeightError: Error {
    case runtimeError(String)
}

protocol Train {
    func getWeight() -> Int
}

class Passenger: Train {
    let WEIGHT:Int = 2000
    let MAX_PASSENGER: Int = 30
    let WEIGHT_PASSENGER: Int = 60
    
    var countPassenger: Int = 0
    var currentWeight: Int {
        return countPassenger * 60
    }
    
    init(countPassenger: Int) throws {
        self.countPassenger = countPassenger
        if (currentWeight > WEIGHT) {
            throw WeightError.runtimeError("Weight is very large")
        }
        else if (countPassenger > WEIGHT) {
            throw WeightError.runtimeError("Passenger is too more than 60")
        }
    }
    func getWeight() -> Int {
        return currentWeight
    }
    
}
class Cargo: Train {
    let WEIGHT:Int = 1500
    var currentWeight = 0
    
    init(currentWeight: Int) throws {
        self.currentWeight = currentWeight
        if (currentWeight > WEIGHT) {
            throw WeightError.runtimeError("Weight is very large")
        }
    }
    func getWeight() -> Int {
        return currentWeight
    }
}

var train:[Train] = []
do {
    train = [try Passenger(countPassenger: 23), try Cargo(currentWeight: 500),try Cargo(currentWeight: 600)]
    var sum = 0
    train.forEach {
        sum += $0.getWeight()
    }
    print("Weight: \(sum)")
} catch WeightError.runtimeError(let errorMessage) {
    print(errorMessage)
}
