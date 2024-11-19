//
//  CategoryDetailView.swift
//  Quotely
//
//  Created by Maxim Svidrak on 12.11.24.
//

import SwiftUI

struct CategoryDetailView: View {
    var category: String
    var quotes: [Quote]
    
    var body: some View {
        VStack {
                Text("Category: \(category.capitalizingFirstLetter())")
                    .font(.title.bold())
                    .padding(.bottom)

                ScrollView {
                    LazyVStack(spacing: 10) {
                        ForEach(quotes, id: \.id) { quote in
                            VStack(alignment: .leading) {
                                Text(quote.text)
                                    .font(.headline)
                                Divider()
                                HStack {
                                    Spacer()
                                    Text(quote.author)
                                        .font(.subheadline)
                                        .foregroundStyle(.black.opacity(0.8))
                                }
                            }
                            .padding()
                            .background(Color.white.opacity(0.7))
                            .cornerRadius(15)
                            .shadow(color: Color.gray, radius: 10, x: 0, y: 0)
                            .padding(.horizontal)
                        }
                    }
                    .padding(.vertical)
                }
                .animatedGradientBackground()
            }
            .animatedGradientBackground()
    }

    
}

#Preview {
    CategoryDetailView(category: "", quotes: [Quote(id: "", text: "", author: "", category: "", language: "")])
}
    
