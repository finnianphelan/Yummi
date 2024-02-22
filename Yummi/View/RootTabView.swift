//
//  RootTabView.swift
//  Yummi
//
//  Created by Phelan, Finnian (PAH) on 22/02/2024.
//

import SwiftUI

struct RootTabView: View {
    var body: some View {
        TabView {
            IngredientsView()
                .tabItem {
                    Image(systemName: "carrot")
                    Text("Ingredients")
                }
            RecipesView()
                .tabItem {
                    Image(systemName: "doc")
                    Text("Recipes")
                }
        }
    }
}

#Preview {
    RootTabView()
}
