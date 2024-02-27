//
//  RecipeItemView.swift
//  Yummi
//
//  Created by Phelan, Finnian (PAH) on 27/02/2024.
//

import SwiftUI

struct RecipeItemView: View {
    @State var recipe: Recipe
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Image(recipe.imageFilePath)
                        .resizable()
                        .scaledToFill()
                }
                
                Button (action: {
                    recipe.isFavourite.toggle()
                }, label: {
                    Image(systemName: recipe.isFavourite ? "star.fill" : "star")
                        .foregroundColor(.yellow)
                })
                
                RatingView(recipe: recipe, type: "heart", color: .red)
                
                Section {
                    Text("Ingredients")
                        .bold()
                    VStack {
                        ForEach(recipe.ingredients) { ingredient in
                            Text(ingredient.name)
                        }
                    }
                }
            }
            .navigationTitle(recipe.name)
        }
    }
}

#Preview {
    RecipeItemView(recipe: Recipe.examples[0])
}
