//
//  QuoteView.swift
//  Quotely
//
//  Created by Maxim Svidrak on 11.11.24.
//

import SwiftUI

struct QuoteView: View {
    
    @State var quote: Quote? = dummyQuotes.randomElement()
    
    var body: some View {
        VStack {
            
            ZStack {
                Text("Category: \(quote?.category ?? "Unknown")")
                    .font(.headline)
                    .foregroundStyle(.black)

                HStack {
                    Spacer()
                    
                    Image (systemName: "line.horizontal.3.decrease.circle")
                        .foregroundStyle(.yellow)
                        .font(.headline.bold())
//                        .frame(alignment: .trailing)
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
            .background(.white)
            .clipShape(.buttonBorder)
            .shadow(color: .gray, radius: 10, x: 0, y: 0)
            .padding(.leading)
            .padding(.trailing)
            
            Spacer()
            
            Button (action: {
                    self.randomQuote()
            }) {
                HStack {

                    Image (systemName: "arrow.clockwise")
                        .foregroundStyle(.black)
                        .font(.headline.bold())
                    
                    Text("New Quote")
                        .font(.headline)
                        .foregroundStyle(.black)
                    
                }
                .frame(maxWidth: .infinity)
                
                    
            }
            
            .padding()
            .buttonStyle(.borderedProminent)
            .tint(.yellow)
        }
    }
    
    private func randomQuote()  {
        self.quote = dummyQuotes.randomElement()
    }
}

#Preview {
    QuoteView(quote: dummyQuotes.randomElement())
}
