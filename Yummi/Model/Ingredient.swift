//
//  Ingredient.swift
//  Yummi
//
//  Created by Phelan, Finnian (PAH) on 23/01/2024.
//

import Foundation

struct Ingredient: Identifiable {
    let name: String
    let quantity: Int
    let category: String
    let expiryDate: String
    var id: String {name}
    
    func displayText(includeTitle: Bool) -> String {
        if includeTitle {
            return """
Name: \(name)
Quantity: \(quantity) units
Category: \(category)
Expiry Date: \(expiryDate)
"""
        } else {
            return """
Quantity: \(quantity) units
Category: \(category)
Expiry Date: \(expiryDate)
"""
        }
    }
}
