//
//  IngredientsView.swift
//  Yummi
//
//  Created by Phelan, Finnian (PAH) on 06/02/2024.
//

import SwiftUI

struct IngredientsView: View {
    
    @State var ingredientsViewModel = IngredientsViewModel()
    
    var body: some View {
        
        NavigationView {
            Form {
                
                if ingredientsViewModel.ingredients.count == 0 {
                    Text("No Ingredients")
                }
                else {
                    Section {
                        Text(ingredientsViewModel.ingredients[ingredientsViewModel.ingredientIndex].displayText(includeTitle: true))
                        
                        HStack {
                            Button(
                                action: {
                                    if ingredientsViewModel.ingredientIndex != ingredientsViewModel.ingredients.count-1 {
                                        ingredientsViewModel.ingredientIndex += 1
                                } else {
                                    ingredientsViewModel.ingredientIndex = 0
                                }
                            },
                                label: {Text("Next Ingredient")}
                            )
                            
                            Spacer()
                            
                            if ingredientsViewModel.ingredients.count != 0 {
                                Text("\(ingredientsViewModel.ingredientIndex+1)/\(ingredientsViewModel.ingredients.count)")
                            }
                        }
                    }
                    .contextMenu {
                        Button {
                            ingredientsViewModel.ingredients.remove(at: ingredientsViewModel.ingredientIndex)
                        } label: {
                            Label("Delete", systemImage: "trash")
                                .tint(.red)
                        }
                    }
                }

                Button("Add New Ingredient") {
                    ingredientsViewModel.showingIngredientsForm.toggle()
                }
                .sheet(isPresented: $ingredientsViewModel.showingIngredientsForm) {
                    Form {
                        TextField("Name", text: $ingredientsViewModel.ingredientName)
                        HStack {
                            Text("\(ingredientsViewModel.ingredientQuantity)")
                            Stepper("", value: $ingredientsViewModel.ingredientQuantity)
                            Text("Quantity")
                        }
                        
                        Picker("Category", selection: $ingredientsViewModel.ingredientCategory) {
                            Text("Carbohydrate").tag("Carbohydrate")
                            Text("Human").tag("Human")
                            Text("Meat").tag("Meat")
                            Text("Dairy").tag("Dairy")
                        }
                        
                        TextField("Expiry Date", text: $ingredientsViewModel.ingredientExpiryDate)
                        
                        Button(
                            action: {
                                ingredientsViewModel.addNewIngredient()
                                ingredientsViewModel.showingIngredientsForm.toggle()
                            },
                            label: {Text("Add New Ingredient")}
                        )
                    }
                }
                
                Section("All Ingredients") {
                    ForEach(ingredientsViewModel.categories) { category in
                        Section {
                            ForEach(ingredientsViewModel.ingredients) { ingredient in
                                if ingredient.category == category {
                                    Text(ingredientsViewModel.ingredients[ingredientsViewModel.ingredientIndex].displayText(includeTitle: false))
                                }
                            }
                        }
                    }
                }
                
            }
            .navigationBarTitle("Add Ingredients", displayMode: .inline)
        }
    }
}

#Preview {
    IngredientsView()
}
