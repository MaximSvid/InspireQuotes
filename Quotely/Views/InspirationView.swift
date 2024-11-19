//
//  InspirationView.swift
//  Quotely
//
//  Created by Maxim Svidrak on 11.11.24.
//

import SwiftUI

struct InspirationView: View {
    
    
    @State private var inspirationImage: [Inspiration] = []
    
    let columns = [GridItem (.flexible()), GridItem (.flexible())]
    
    
    var body: some View {
        
        VStack() {
            
            Text("Inspiration")
                .font(.title.bold())
                .padding(.bottom)
            
            ScrollView {
                
                
                
                LazyVGrid(columns: columns) {
                    ForEach(inspirationImage, id: \.id) { image in
                        GeometryReader { geometry in
                            if let url = URL(string: image.urls.regular) {
                                AsyncImage(url: url) { phase in
                                    switch phase {
                                    case .empty:
                                        ProgressView()
                                            .frame(width: geometry.size.width, height: geometry.size.height)
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: geometry.size.width, height: geometry.size.height)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                    case .failure:
                                        Image(systemName: "photo")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: geometry.size.width, height: geometry.size.height)
                                            .foregroundColor(.gray)
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                            } else {
                                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geometry.size.width, height: geometry.size.height)
                                    .foregroundColor(.gray)
                            }
                        }
                        .aspectRatio(1, contentMode: .fill)
                    }
                }
            }
        }
        .animatedGradientBackground()
        
        .onAppear {
            fetchInspirationImage()
        }
    }
    
    private func fetchInspirationImage() {
        Task {
            do {
                let images = try await getInspirationImage()
                DispatchQueue.main.async {
                    self.inspirationImage = images
                }
            } catch {
                print(error)
            }
        }
        
    }
    
    private func getInspirationImage() async throws ->  [Inspiration] {
        
        let API_KEY_INSPIRATION = "mVe5uKfCQ3P1BUu5bHCgZ-yo40fjJ-wO6SIfZS5crtQ"
        
        let urlString = "https://api.unsplash.com/photos/?client_id=\(API_KEY_INSPIRATION)"
        
        guard let url = URL(string: urlString) else {
            throw HTTPError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let inspitarionImage = try JSONDecoder().decode([Inspiration].self, from: data)
        
        return inspitarionImage
        
        
    }
}

#Preview {
    InspirationView()
}
