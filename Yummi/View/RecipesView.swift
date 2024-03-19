//
//  RecipesView.swift
//  Yummi
//
//  Created by Phelan, Finnian (PAH) on 30/01/2024.
//

import SwiftUI

struct RecipesView: View {
    
    @State var recipesViewModel = RecipesViewModel.shared
    
    var body: some View {
        
        NavigationStack {
            
            Form {
                List {
                    ForEach(recipesViewModel.recipes) { recipe in
                        Section {
                            NavigationLink(destination: RecipeItemView(recipe: recipe)) {
                                Text(recipe.name)
                                Text("\(recipe.rating) / 10")
                                Image(systemName: recipe.isFavourite ? "star.fill" : "star")
                                    .foregroundColor(.yellow)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Recipes")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        recipesViewModel.showingRecipesForm.toggle()
                    }, label: {Image(systemName: "plus")})
                    .sheet(isPresented: $recipesViewModel.showingRecipesForm) {
                        Form {
                            TextField("Name", text: $recipesViewModel.recipeName)
        
                            TextField("Ingredients", text: $recipesViewModel.recipeIngredients)
        
                            Toggle("Favourite:", isOn: $recipesViewModel.recipeIsFavourite)
        
                            TextField("Rating", text: $recipesViewModel.recipeRating)
        
                            Button(
                                action: {
        
                                    let recipeIngredientsArray = recipesViewModel.recipeIngredients.split(separator: ", ")
                                    var recipeIngredientsArrayTyped: [Ingredient] = []
                                    for recipeIngredient in recipeIngredientsArray {
                                        recipeIngredientsArrayTyped.append(Ingredient(name: String(recipeIngredient), quantity: 1, category: "Carbohydrate", expiryDate: "Dec 25th"))
                                    }

                                    recipesViewModel.recipes.append(Recipe(name: recipesViewModel.recipeName, ingredients: recipeIngredientsArrayTyped, isFavourite: recipesViewModel.recipeIsFavourite, rating: Int(recipesViewModel.recipeRating) ?? 0, imageFilePath: "redVelvetCake"))
        
                                    recipesViewModel.recipeName = ""
                                    recipesViewModel.recipeIngredients = ""
                                    recipesViewModel.recipeIsFavourite = false
                                    recipesViewModel.recipeRating = ""
                                    recipesViewModel.showingRecipesForm = false
                                },
                                label: {Text("Add")}
                            )
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    RecipesView()
}
