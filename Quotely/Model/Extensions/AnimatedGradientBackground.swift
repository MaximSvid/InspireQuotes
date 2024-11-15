//
//  AnimatedGradientBackground.swift
//  Quotely
//
//  Created by Maxim Svidrak on 14.11.24.
//

import SwiftUI

struct AnimatedGradientBackground: ViewModifier {
    @State private var animateGradient = false
    
    func body(content: Content) -> some View {
        content
            .background(
                LinearGradient(colors: [.teal, .cyan, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                    .hueRotation(.degrees(animateGradient ? 45 : 0))
                    .onAppear {
                        withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                            animateGradient.toggle()
                        }
                    }
            )
    }
}



struct StaticGradientBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                LinearGradient(colors: [.purple, .pink, .orange], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
            )
    }
}

extension View {
    func animatedGradientBackground() -> some View {
        self.modifier(AnimatedGradientBackground())
    }
    
    func staticGradientBackground() -> some View {
            self.modifier(StaticGradientBackground())
        }
}
