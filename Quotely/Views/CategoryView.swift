//
//  CategoryView.swift
//  Quotely
//
//  Created by Maxim Svidrak on 11.11.24.
//

import SwiftUI

struct CategoryView: View {
    
    @State private var quoteCategories: [String] = []
        
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
        ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(quoteCategories, id: \.self) { category in
                        NavigationLink(destination: CategoryDetailView(category: category)) {
                            Text(category)
                                .foregroundStyle(.black)
                        }
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: 150)
                    .padding()
                    .font(.headline)
                    .background(Color.white)
                    .clipShape(.buttonBorder)
                    .shadow(color: Color.gray, radius: 10, x: 0, y: 0)
                    .padding()
                }
                .onAppear{
                    loadCategories()
                }
            }
            
        }
        .navigationTitle("Categories")
    }
    private func loadCategories() {
        let uniqueCategories = Set(dummyQuotes.map{ $0.category})
        quoteCategories = Array(uniqueCategories)
        
    }
}

#Preview {
    CategoryView()
}
