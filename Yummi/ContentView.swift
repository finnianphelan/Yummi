//
//  ContentView.swift
//  Yummi
//
//  Created by Phelan, Finnian (PAH) on 23/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    let banana = Ingredient(icon: "🍌", name: "Banana", quantity: 3.0, category: "Fruit", expiryDate: "Dec  25th")
    
    var body: some View {
        VStack {
            Text(banana.icon)
            Text(banana.display())
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
