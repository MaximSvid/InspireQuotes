//
//  QuoteView.swift
//  Quotely
//
//  Created by Maxim Svidrak on 11.11.24.
//

import SwiftUI

struct QuoteView: View {
    var body: some View {
        VStack {
            
            VStack {
                HStack {

                    Text ("Category: Music")
                        .font(.headline)

                    
                    Image (systemName: "line.horizontal.3.decrease.circle")
                        .padding(.trailing)
                        .font(.headline.bold())
                        
                }
                .frame(maxWidth: .infinity)
                .tint(.yellow)
                .background(.yellow)
            }
        
            
           
            
            Spacer()
            
            VStack {
                Text ("Qulte asdf  asdf;kj askl; kjasdf k;j kl;asdfkj k;jasdfklj kjasdf ljk;lasdf kj ;kasdf jk;jlasdf kjl;lkasdf ljl;jasdf kjlk;asdf kjlkl;jasdf jk")
                    .font(.title2.bold())
                
                Divider()
                
                HStack {
                    Spacer()
                    
                    Text("Author: John Coltrane")
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
}

#Preview {
    QuoteView()
}
