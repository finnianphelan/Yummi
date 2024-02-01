//
//  ContentView.swift
//  Yummi
//
//  Created by Phelan, Finnian (PAH) on 23/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var ingredients: [Ingredient] = []
    
    @State var ingredientIndex = 0
    
    @State var ingredientName = ""
    @State var ingredientQuantity = 1
    @State var ingredientCategory = ""
    @State var ingredientExpiryDate = ""
    
    var body: some View {
        
        Form {
            
            if ingredients.count == 0 {
                Text("No Ingredients")
            }
            else {
                Section {
                    Text(ingredients[ingredientIndex].displayText())
                    
                    Button(
                        action: {
                        if ingredientIndex != ingredients.count-1 {
                            ingredientIndex += 1
                        } else {
                            ingredientIndex = 0
                        }
                    },
                        label: {Text("Next Ingredient")}
                    )
                }
            }

            Section {
                TextField("Name", text: $ingredientName)
                HStack {
                    Text("\(ingredientQuantity)")
                    Stepper("", value: $ingredientQuantity)
                    Text("Quantity")
                }
                TextField("Category", text: $ingredientCategory)
                TextField("Expiry Date", text: $ingredientExpiryDate)
                
                Button(
                    action: {
                        ingredients.append(Ingredient(name: ingredientName, quantity: ingredientQuantity, category: ingredientCategory, expiryDate: ingredientExpiryDate))
                        ingredientIndex = ingredients.count-1
                        
                        ingredientName = ""
                        ingredientQuantity = 1
                        ingredientCategory = ""
                        ingredientExpiryDate = ""
                    },
                    label: {Text("Add New Ingredient")}
                )
            }
        }
    }
}

#Preview {
    ContentView()
}
