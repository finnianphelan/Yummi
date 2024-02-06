//
//  RecipesView.swift
//  Yummi
//
//  Created by Phelan, Finnian (PAH) on 30/01/2024.
//

import SwiftUI

struct RecipesView: View {
    
    @State var recipes = Recipe.factoryMethod()
    
    @State var recipeName = ""
    @State var recipeIngredients: [Ingredient] = []
    @State var recipeIsFavourite = false
    @State var recipeRating = 0.0
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section {
                    TextField("Name", text: $recipeName)
                    
                    Toggle("Favourite:", isOn: $recipeIsFavourite)
                    
                    Button(
                        action: {
                            recipes.append(Recipe(name: recipeName, ingredients: recipeIngredients, isFavourite: recipeIsFavourite, rating: recipeRating))
                            
                            recipeName = ""
                            recipeIngredients = ""
                            recipeIsFavourite = false
                            recipeRating = 0.0
                        },
                        label: {Text("Add New Recipe")}
                    )
                }
                
                List(recipes) { recipe in
                    Section {
                        Text(recipe.name)
                        
                        HStack {
                            ForEach(recipe.recipes) { ingredient in
                                Text(ingredient.name)
                            }
                        }
                        
                        Text(recipe.isFavourite ? "Favourite" : "Not Favourite")
                        Text("\(recipe.rating) / 10")
                    }
                }
            }
            .navigationTitle("Recipes")
        }
    }
}

#Preview {
    RecipesView()
}
