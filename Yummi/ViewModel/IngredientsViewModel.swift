//
//  IngredientsViewModel.swift
//  Yummi
//
//  Created by Phelan, Finnian (PAH) on 29/02/2024.
//

import Foundation

@Observable
class IngredientsViewModel {
    
    static var shared = IngredientsViewModel()
    
    var ingredients: [Ingredient] = []
    
    var ingredientIndex = 0
    
    var ingredientName = ""
    var ingredientQuantity = 1
    var ingredientCategory = ""
    var ingredientExpiryDate = ""
    
    var showingIngredientsForm = false
    
    let categories = ["Carbohydrate", "Human", "Meat", "Dairy"]
    
    func addNewIngredient() {
        ingredients.append(Ingredient(name: ingredientName, quantity: ingredientQuantity, category: ingredientCategory, expiryDate: ingredientExpiryDate))
        ingredientIndex = ingredients.count-1
        
        ingredientName = ""
        ingredientQuantity = 1
        ingredientCategory = ""
        ingredientExpiryDate = ""
    }
}
