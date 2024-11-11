//
//  CategoryView.swift
//  Quotely
//
//  Created by Maxim Svidrak on 11.11.24.
//

import SwiftUI

struct CategoryView: View {
    
    let categories = ["motivation", "life", "love", "wisdom", "success", "happiness", "courage", "firendship", "education", "future"]
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(categories, id: \.self) { category in
                    Text(category)
                }
                .frame(maxWidth: .infinity, maxHeight: 150)
                .padding()
                .font(.headline)
                .background(Color.white)
                .clipShape(.buttonBorder)
                .shadow(color: Color.gray, radius: 10, x: 0, y: 0)
                .padding()
            }
        }
    }
}

#Preview {
    CategoryView()
}
