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
    @State var recipeQuantity = 1
    @State var ingredientCategory = ""
    @State var ingredientExpiryDate = ""
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section {
                    TextField("Name", text: $recipeName)
                    HStack {
                        Text("\(recipeQuantity)")
                        Stepper("", value: $recipeQuantity)
                        Text("Quantity")
                    }
                    
                    Picker("Category", selection: $ingredientCategory) {
                        Text("Carbohydrate").tag("Carbohydrate")
                        Text("Human").tag("Human")
                        Text("Meat").tag("Meat")
                        Text("Dairy").tag("Dairy")
                    }
                    
                    TextField("Expiry Date", text: $ingredientExpiryDate)
                    
                    Button(
                        action: {
                            recipes.append(Recipe(name: recipeName, quantity: recipeQuantity, category: ingredientCategory, expiryDate: ingredientExpiryDate))
                            
                            recipeName = ""
                            recipeQuantity = 1
                            ingredientCategory = ""
                            ingredientExpiryDate = ""
                        },
                        label: {Text("Add New Recipe")}
                    )
                }
                
                List {
                    ForEach(recipes) { recipe in
                        Section {
                            Text(recipe.name)
                                .bold()
                            
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
            }
            .navigationTitle("Recipes")
        }
    }
}

#Preview {
    RecipesView()
}
