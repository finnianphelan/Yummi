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
    var rating: Int
    let imageFilePath: String
    var id: String {name}
    
    static var examples: [Recipe] {
        return [
            Recipe(
                name: "Red Velvet Cake",
                ingredients: [
                    Ingredient(name: "Flour", quantity: 2, category: "Cooking", expiryDate: "Jan 12th"),
                    Ingredient(name: "Eggs", quantity: 2, category: "Cooking", expiryDate: "Jan 12th"),
                    Ingredient(name: "Milk", quantity: 2, category: "Dairy", expiryDate: "Jan 12th"),
                ],
                isFavourite: true,
                rating: 9,
                imageFilePath: "redVelvetCake"
            ),
            
            Recipe(
                name: "Baked Alaska",
                ingredients: [
                    Ingredient(name: "Flour", quantity: 2, category: "Cooking", expiryDate: "Jan 12th"),
                    Ingredient(name: "Eggs", quantity: 2, category: "Cooking", expiryDate: "Jan 12th"),
                    Ingredient(name: "Milk", quantity: 2, category: "Dairy", expiryDate: "Jan 12th"),
                ],
                isFavourite: false,
                rating: 8,
                imageFilePath: "redVelvetCake"
            ),
            
            Recipe(
                name: "Pancakes",
                ingredients: [
                    Ingredient(name: "Flour", quantity: 2, category: "Cooking", expiryDate: "Jan 12th"),
                    Ingredient(name: "Eggs", quantity: 2, category: "Cooking", expiryDate: "Jan 12th"),
                    Ingredient(name: "Milk", quantity: 2, category: "Dairy", expiryDate: "Jan 12th"),
                ],
                isFavourite: false,
                rating: 7,
                imageFilePath: "redVelvetCake"
            ),
            
            Recipe(
                name: "Waffles",
                ingredients: [
                    Ingredient(name: "Flour", quantity: 2, category: "Cooking", expiryDate: "Jan 12th"),
                    Ingredient(name: "Eggs", quantity: 2, category: "Cooking", expiryDate: "Jan 12th"),
                    Ingredient(name: "Milk", quantity: 2, category: "Dairy", expiryDate: "Jan 12th"),
                ],
                isFavourite: true,
                rating: 9,
                imageFilePath: "redVelvetCake"
            ),
        ]
    }
}
