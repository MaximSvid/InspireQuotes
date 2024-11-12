//
//  CategoryDetailView.swift
//  Quotely
//
//  Created by Maxim Svidrak on 12.11.24.
//

import SwiftUI

struct CategoryDetailView: View {
    

    var category: String
    
    var body: some View {
        VStack {
            Text(category)
                .font(.title)
        }
    }
    
}

#Preview {
    CategoryDetailView(category: "")
}
    
