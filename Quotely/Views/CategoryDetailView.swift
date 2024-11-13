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
            
            List (quotes, id: \.id){quote in
                VStack(alignment: .leading) {
                    Text(quote.text)
                        .font(.headline)
                    HStack {
                        Spacer()
                        Text(quote.author)
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                    
                }
                .padding(.vertical, 5)
            }
            
        }
    }
    
//    extension String {
//        func capitalizingFirstLetter() -> String {
//            return prefix(1).capitalized + dropFirst()
//        }
//    }
    
}

#Preview {
    CategoryDetailView(category: "", quotes: [Quote(id: "", text: "", author: "", category: "", language: "")])
}
    
