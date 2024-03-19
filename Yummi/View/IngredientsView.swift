//
//  IngredientsView.swift
//  Yummi
//
//  Created by Phelan, Finnian (PAH) on 06/02/2024.
//

import SwiftUI

struct IngredientsView: View {
    
    @State var ingredientsViewModel = IngredientsViewModel.shared
    
    var body: some View {
        
        NavigationStack {
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
            }
            .navigationBarTitle("Add Ingredients", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        ingredientsViewModel.showingIngredientsForm.toggle()
                    }, label: {Image(systemName: "plus")})
                    .sheet(isPresented: $ingredientsViewModel.showingIngredientsForm) {
                        Form {
                            TextField("Name", text: $ingredientsViewModel.ingredientName)
                            HStack {
                                Text("\(ingredientsViewModel.ingredientQuantity)")
                                Stepper("", value: $ingredientsViewModel.ingredientQuantity)
                                Text("Quantity")
                            }
                            
                            Picker("Category", selection: $ingredientsViewModel.ingredientCategory) {
                                ForEach(ingredientsViewModel.categories, id: \.self) { category in
                                    Text(category).tag(category)
                                }
                            }
                            
                            TextField("Expiry Date", text: $ingredientsViewModel.ingredientExpiryDate)
                            
                            Button(
                                action: {
                                    ingredientsViewModel.addNewIngredient()
                                    ingredientsViewModel.showingIngredientsForm = false
                                },
                                label: {Text("Add New Ingredient")}
                            )
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    IngredientsView()
}
