//
//  InspirationView.swift
//  Quotely
//
//  Created by Maxim Svidrak on 11.11.24.
//

import SwiftUI

struct InspirationView: View {
    var inspitationImage: [String] = ["image1", "image01","image3","image02", "image4", "image03", "image5","image04", "image6", "image05", "image7", "image06",  "image8", "image07", "image9", "image08", "image10", "image11", "image09"]
    
    let columns = [GridItem (.flexible()), GridItem (.flexible())]
    
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(inspitationImage, id: \.self) { image in
                    GeometryReader { geometry in
                        Image(image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .aspectRatio(1, contentMode: .fill)
                }
            }
        }
    }
}

#Preview {
    InspirationView()
}
