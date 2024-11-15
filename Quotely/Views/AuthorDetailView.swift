//
//  AuthorDetailView.swift
//  Quotely
//
//  Created by Maxim Svidrak on 14.11.24.
//

import SwiftUI

struct AuthorDetailView: View {
    
    var author: Author
    @State private var quotes: [Quote] = []
    
    var body: some View {
        VStack {
            Text("Quotes by: \(author.name)")
                .font(.title.bold())
                .padding(.bottom)
            
            List(quotes, id: \.id) { quote in
                Text(quote.text)
            }
        }
        .onAppear {
            fetchQuotesByAuthor()
        }
    }
    
    private func fetchQuotesByAuthor() {
        Task {
            do {
                quotes = try await getQuotes()
            } catch {
                print(error)
            }
        }
    }
    
    private func getQuotes() async throws -> [Quote] {
        let urlString = "https://api.syntax-institut.de/quotes?limit=1000&author=\(author.urlName)&key=\(APIKEY)"
        
        guard let url = URL(string: urlString) else {
            throw HTTPError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode([Quote].self, from: data)
        
        return result
    }
}

#Preview {
    AuthorDetailView(author: Author(id: "", name: "", urlName: ""))
}
