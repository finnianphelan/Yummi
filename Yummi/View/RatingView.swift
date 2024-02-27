//
//  RatingView.swift
//  Yummi
//
//  Created by Phelan, Finnian (PAH) on 27/02/2024.
//

import SwiftUI

struct RatingView: View {
    @State var recipe: Recipe
    let type: String
    let color: Color
    
    var body: some View {
        HStack() {
            ForEach(1..<11) { num in
                if num <= recipe.rating {
                    Button(action: {
                        recipe.rating = num
                    }, label: {
                        Image(systemName: "\(type).fill")
                            .foregroundColor(color)
                    })
                } else {
                    Button(action: {
                        recipe.rating = num
                    }, label: {
                        Image(systemName: "\(type)")
                            .foregroundColor(color)
                    })
                }
            }
        }
    }
}

#Preview {
    RatingView(recipe: Recipe.examples[0], type: "heart", color: .red)
}
