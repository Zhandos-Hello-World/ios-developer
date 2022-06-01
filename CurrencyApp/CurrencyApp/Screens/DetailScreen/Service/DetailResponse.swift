//
//  DetailResponse.swift
//  CurrencyApp
//
//  Created by Zhandos Baimurat on 01.06.2022.
//

import Foundation


struct DetailItem: Decodable {
    private var prices: [[Double]] = []
    
    
    
    func getValue(_ row: Int) -> String {
        formatForChange(prices[row][1])
    }
    func getValueChange(_ row: Int) -> String {
        symbol(calculate(row)) + formatForPercentageChange(calculatePercent(row))
    }
    
    private func formatForChange(_ number: Double) -> String {
        var temp = number
        lengthFormat(&temp)
        
        let tempString = "$" + String(temp)
        return tempString
    }
    
    private func lengthFormat(_ number: inout Double) {
        guard let n = Double(String(format: "%.2f", number)) else {
            return
        }
        number = n
    }
    
    private func formatForPercentageChange(_ number: Double) -> String {
        var temp = number
        lengthFormat(&temp)
        
        var tempString = String(temp)
        tempString = "(\(tempString.replacingOccurrences(of: ".", with: ","))%)"
        
        return tempString
    }
    
    private func calculate(_ row: Int) -> Double {
        prices[row][1] - prices[row + 1][1]
    }
    private func calculatePercent(_ row: Int) -> Double {
        let max = Double.maximum(prices[row][1], prices[row + 1][1])
        let min = Double.minimum(prices[row][1], prices[row + 1][1])
        
        return 100.0 - ((min * 100.0) / max)
    }
    
    
    private func symbol(_ temp: Double) -> String {
        var t = temp
        lengthFormat(&t)
        var tempString = "\(t)"
        if temp > 0 {
            tempString = "+$\(tempString)"
        }
        
        else if temp < 0 {
            tempString = "-$\(tempString.suffix(tempString.count - 1))"
        }
        return tempString
    }
}
