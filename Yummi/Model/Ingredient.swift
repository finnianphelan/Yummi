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
    
    func displayText() -> String {
        return """
Name: \(name)
Quantity: \(quantity) units
Category: \(category)
Expiry Date: \(expiryDate)
"""
    }
}
