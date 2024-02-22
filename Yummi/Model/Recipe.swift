//
//  Recipe.swift
//  Yummi
//
//  Created by Phelan, Finnian (PAH) on 30/01/2024.
//

import Foundation

struct Recipe: Identifiable {
    let name: String
    let ingredients: [Ingredient]
    var isFavourite: Bool
    var rating: String
    var id: String {name}
    
    static func factoryMethod() -> [Recipe] {
        return [
            Recipe(
                name: "Red Velvet Cake",
                ingredients: [
                    Ingredient(name: "Flour", quantity: 2, category: "Cooking", expiryDate: "Jan 12th"),
                    Ingredient(name: "Eggs", quantity: 2, category: "Cooking", expiryDate: "Jan 12th"),
                    Ingredient(name: "Milk", quantity: 2, category: "Dairy", expiryDate: "Jan 12th"),
                ],
                isFavourite: true,
                rating: "9.5"
            ),
            
            Recipe(
                name: "Baked Alaska",
                ingredients: [
                    Ingredient(name: "Flour", quantity: 2, category: "Cooking", expiryDate: "Jan 12th"),
                    Ingredient(name: "Eggs", quantity: 2, category: "Cooking", expiryDate: "Jan 12th"),
                    Ingredient(name: "Milk", quantity: 2, category: "Dairy", expiryDate: "Jan 12th"),
                ],
                isFavourite: false,
                rating: "8.0"
            ),
            
            Recipe(
                name: "Pancakes",
                ingredients: [
                    Ingredient(name: "Flour", quantity: 2, category: "Cooking", expiryDate: "Jan 12th"),
                    Ingredient(name: "Eggs", quantity: 2, category: "Cooking", expiryDate: "Jan 12th"),
                    Ingredient(name: "Milk", quantity: 2, category: "Dairy", expiryDate: "Jan 12th"),
                ],
                isFavourite: false,
                rating: "7.5"
            ),
            
            Recipe(
                name: "Waffles",
                ingredients: [
                    Ingredient(name: "Flour", quantity: 2, category: "Cooking", expiryDate: "Jan 12th"),
                    Ingredient(name: "Eggs", quantity: 2, category: "Cooking", expiryDate: "Jan 12th"),
                    Ingredient(name: "Milk", quantity: 2, category: "Dairy", expiryDate: "Jan 12th"),
                ],
                isFavourite: true,
                rating: "9.0"
            ),
        ]
    }
}
