import UIKit

import SwiftUI

struct Animal {
    let name: String
}
class Formatter {}

class Document {
    var name: String
    var content: String
    var url: URL?
    var animal: Animal?

    init(name: String, content: String, url: URL) {
        self.name = name
        self.content = content
        self.url = url
    }
    
    func send() -> Bool {
        guard let url = url else {
            return false
        }
        print(url)
        // Отправка документа на сервер
        return false
    }
    
    func printAnimalName() {
        print(animal?.name ?? "")
    }
}

class PDF {
    let document: Document
    let service: Formatter

    init(document: Document, service: Formatter) {
        self.document = document
        self.service = service
    }

    func create() -> Data {
        // Тут мы можем создавать из документа Data
        return Data()
    }
    
    func parsingPDFtoPhone() {
        // Тут парсим PDF для показа на разные устройства
    }
    
    func parsingPDFtoComputer() {
        // Тут парсим PDF для показа на разные устройства
    }
    
    func parsingPDFtoPaper() {
        // Тут парсим PDF для показа на разные устройства
    }
}

class FileManager {
    var service: Formatter?
    
    func sendPDF(_ pdf: PDF) {
        service = pdf.service
        // отправялем PDF
    }
    
    func sendDocument(_ doc: Document) {
        // отправялем Doc
    }
    
    func savePDF(_ pdf: PDF) {
        // сохраняем PDF
    }
    
    func saveDocument(_ doc: Document) {
        // сохраняем Doc
    }
}

protocol Machine {
    func convert(document: Document) -> PDF?
    func convert(document: Document) -> Image?
    func sendFax(document: Document)
}

class NewIphone: Machine {
    var pdf: PDF? = nil
    
    init(pdf: PDF) {
        self.pdf = pdf
    }
    
    func convert(document: Document) -> PDF? {
        return pdf
    }
    func convert(document: Document) -> Image? {
        return Image(String(describing: pdf?.document.url))
    }
    func sendFax(document: Document) {
        
    }
}
class FaxMachine: Machine {
    var pdf: PDF? = nil
    
    init(pdf: PDF) {
        self.pdf = pdf
    }
    
    func convert(document: Document) -> PDF? {
        return pdf
    }
    func convert(document: Document) -> Image? {
        return Image(String(describing: pdf?.document.url))
    }
    func sendFax(document: Document) {
        
    }
}
