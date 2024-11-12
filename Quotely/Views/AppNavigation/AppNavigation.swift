//
//  AppNavigation.swift
//  Quotely
//
//  Created by Maxim Svidrak on 11.11.24.
//

import SwiftUI

struct AppNavigation: View {
    var body: some View {
        TabView {
            Tab("Quote", systemImage: "quote.bubble") {
                QuoteView()
            }
            
            Tab("Author", systemImage: "person.2") {
                AuthorView()
            }
            
            Tab("Category", systemImage:  "square.grid.2x2") {
                CategoryView()
            }
            
            Tab ("Inspiration", systemImage: "lightbulb") {
                InspirationView()
            }
        }
        .tint(.yellow)
    }
}

#Preview {
    AppNavigation()
}
