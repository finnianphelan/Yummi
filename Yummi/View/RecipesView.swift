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
    @State var recipeIngredients = ""
    @State var recipeIsFavourite = false
    @State var recipeRating = ""
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
//                Section {
//                    TextField("Name", text: $recipeName)
//                    
//                    TextField("Ingredients", text: $recipeIngredients)
//                    
//                    Toggle("Favourite:", isOn: $recipeIsFavourite)
//                    
//                    TextField("Rating", text: $recipeRating)
//                    
//                    Button(
//                        action: {
//                            
//                            let recipeIngredientsArray = $recipeIngredients.components(separatedBy: ", ")
//                            
//                            recipes.insert(Recipe(name: recipeName, ingredients: recipeIngredientsArray, isFavourite: recipeIsFavourite, rating: recipeRating), at: 0)
//                            
//                            recipeName = ""
//                            recipeIngredients = ""
//                            recipeIsFavourite = false
//                            recipeRating = ""
//                        },
//                        label: {Text("Add")}
//                    )
//                }
                
                List {
                    ForEach(recipes) { recipe in
                        Section {
                            Text(recipe.name)

                            VStack {
                                ForEach(recipe.ingredients) { ingredient in
                                    Text(ingredient.name)
                                }
                            }

                            Text(recipe.isFavourite ? "Favourite" : "Not Favourite")
                            Text("\(recipe.rating) / 10")
                        }
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
