//
//  RecipesViewModel.swift
//  Yummi
//
//  Created by Phelan, Finnian (PAH) on 19/03/2024.
//

import Foundation

@Observable
class RecipesViewModel {
    
    static var shared = RecipesViewModel()
    
    var recipes: [Recipe] = []
    var recipeName = ""
    var recipeIngredients = ""
    var recipeIsFavourite = false
    var recipeRating = ""
    
    var showingRecipesForm = false
}
