//
//  RecipesView.swift
//  Yummi
//
//  Created by Phelan, Finnian (PAH) on 30/01/2024.
//

import SwiftUI

struct RecipesView: View {
    
    @State var recipes = Recipe.factoryMethod()
    
    var body: some View {
        
        List {
            ForEach(recipes) { recipe in
                Section {
                    Text(recipe.name)
                    
                    HStack {
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
}

#Preview {
    RecipesView()
}
