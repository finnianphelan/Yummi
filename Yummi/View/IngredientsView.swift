//
//  IngredientsView.swift
//  Yummi
//
//  Created by Phelan, Finnian (PAH) on 06/02/2024.
//

import SwiftUI

struct IngredientsView: View {
    
    @State var ingredients: [Ingredient] = []
    
    @State var ingredientIndex = 0
    
    @State var ingredientName = ""
    @State var ingredientQuantity = 1
    @State var ingredientCategory = ""
    @State var ingredientExpiryDate = ""
    
    var body: some View {
        
        NavigationView {
            Form {
                
                if ingredients.count == 0 {
                    Text("No Ingredients")
                }
                else {
                    Section {
                        Text(ingredients[ingredientIndex].displayText())
                        
                        HStack {
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
                            
                            Spacer()
                            
                            if ingredients.count != 0 {
                                Text("\(ingredientIndex+1)/\(ingredients.count)")
                            }
                        }
                    }
                    .contextMenu {
                        Button {
                            ingredients.remove(at: ingredientIndex)
                        } label: {
                            Label("Delete", systemImage: "trash")
                                .tint(.red)
                        }
                    }
                }

                Section {
                    TextField("Name", text: $ingredientName)
                    HStack {
                        Text("\(ingredientQuantity)")
                        Stepper("", value: $ingredientQuantity)
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
            .navigationBarTitle("Add Ingredients", displayMode: .inline)
        }
    }
}

#Preview {
    IngredientsView()
}
