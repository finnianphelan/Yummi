//
//  Ingredient.swift
//  Yummi
//
//  Created by Phelan, Finnian (PAH) on 23/01/2024.
//

import Foundation

struct Ingredient {
    let icon: String
    let name: String
    let quantity: Float
    let category: String
    let expiryDate: String
    
    func display() -> String {
        return """
Name: \(name)
Quantity: \(quantity) units
Category: \(category)
Expiry Date: \(expiryDate)
"""
    }
}
