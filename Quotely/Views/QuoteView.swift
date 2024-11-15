//
//  QuoteView.swift
//  Quotely
//
//  Created by Maxim Svidrak on 11.11.24.
//

import SwiftUI

struct QuoteView: View {
    
    @State private var animateGragient: Bool = false
    
    @State var quote: Quote? = nil
    
    var body: some View {
        VStack {
            
            ZStack {
                Text("Category: \(quote?.category ?? "Unknown")")
                    .font(.headline)
                    .foregroundStyle(.black)
                
                HStack {
                    Spacer()
                    
                    Image (systemName: "line.horizontal.3.decrease.circle")
                        .foregroundStyle(.black)
                        .font(.headline.bold())
                        .padding(.trailing)
                }
            }
            .frame(maxWidth: .infinity)
            
            .buttonStyle(.borderedProminent)
            .tint(.yellow)
            
            Spacer()
            
            VStack {
                Text (quote?.text ?? "No Qoute Available")
                    .font(.title2.bold())
                
                
                Divider()
                
                HStack {
                    Spacer()
                    
                    Text(quote?.author ?? "Unknown")
                        .font(.caption)
                        .foregroundStyle(.gray)
                        .padding(.top, 5)
                }
                
                
            }
            .frame(maxWidth: .infinity)
            .padding()
//            .animatedGradientBackground()
            .background(.white)
            .clipShape(.buttonBorder)
            .shadow(color: .gray, radius: 10, x: 0, y: 0)
            .padding(.leading)
            .padding(.trailing)
            
            
            Spacer()
            
            Button (action: {
                fetchQuote()
            }) {
                HStack {
                    
                    Image (systemName: "arrow.clockwise")
                        .foregroundStyle(.black)
                        .font(.headline.bold())
                    
                    Text("New Quote")
                        .font(.headline)
                        .foregroundStyle(.black)
                    
                }
                .frame(maxWidth: 250)
                
                
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 20)
                .fill(.yellow))
//            .buttonStyle(.borderedProminent)
            .tint(.yellow)
        }
        .onAppear{
            fetchQuote()
        }
        .animatedGradientBackground()

    }
    
    private func getQuoteFromAPI() async throws -> Quote {
        
        let urlString = "https://api.syntax-institut.de/quotes"
        
        guard let url = URL(string: urlString) else {
            throw HTTPError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let result = try JSONDecoder().decode([Quote].self, from: data)
        
        guard let firstQuote = result.first else {
            throw HTTPError.invalidURL
        }
        
        return firstQuote

    }
    
    private func fetchQuote() {
        Task {
            do {
                let quote = try await getQuoteFromAPI()
                self.quote = quote
            } catch {
                print(error)
            }
        }
    }
    
}

#Preview {
    QuoteView()
}
