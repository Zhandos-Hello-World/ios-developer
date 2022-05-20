//
//  Data.swift
//  ToDoList
//
//  Created by Zhandos Baimurat on 20.05.2022.
//

import Foundation


class Data: ObservableObject {
    
    var items = [
        Item(name: "Hello1"),
        Item(name: "Hello2"),
        Item(name: "Hello3"),
        Item(name: "Hello4"),
    ]
    private static var data: Data = Data()
    
    static func getINSTANCE() -> Data {
        return data
    }

}
