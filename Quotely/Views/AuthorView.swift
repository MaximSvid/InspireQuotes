//
//  AuthorView.swift
//  Quotely
//
//  Created by Maxim Svidrak on 11.11.24.
//

import SwiftUI

struct AuthorView: View {
    
    @State var authors: [Author] = []
    
    var body: some View {
        
        NavigationStack {
            VStack {
                
                Text("Authors")
                    .font(.title.bold())
                    .padding(.bottom)
                
                List(authors, id: \.id) { author in
                    NavigationLink (destination: AuthorDetailView(author: author)) {
                        Text(author.name)
                            .font(.headline)
                    }
                    
                }
                .onAppear {
                    fetchAuthor()
                }
            }
        }
    }
    
    private func fetchAuthor() {
        Task {
            do {
                authors = try await getAuthor()
            } catch {
                print(error)
            }
        }
    }
    
    private func getAuthor() async throws -> [Author] {
        let urlString = "https://api.syntax-institut.de/authors?key=\(APIKEY)"
        
        guard let url = URL(string: urlString) else {
            throw HTTPError.invalidURL
        }
        
        
        let headers = [
            "AuthorHeaderTest": "\(APIKEY)"
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let result = try JSONDecoder().decode([Author].self, from: data)
        
        return result
    }
}


#Preview {
    AuthorView()
}
// EmWAU3jekZpq8ALVo2FsmUJpSdrnA1UC (apiKey)
