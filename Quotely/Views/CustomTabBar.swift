//
//  CustomTabBar.swift
//  Quotely
//
//  Created by Maxim Svidrak on 15.11.24.
//

import SwiftUI

struct CustomTabBar: View {
    var activeForegroundColor: Color = .white
    var activeBackgroundColor: Color = .blue
    @Binding var activeTab: TabModel
    
    //geometry effect
    @Namespace private var animation
    var body: some View {
        HStack(spacing: 0) {
            ForEach(TabModel.allCases, id: \.rawValue) { tab in
                Button{
                    activeTab = tab
                } label: {
                    HStack(spacing: 10) {
                        Image(systemName: tab.rawValue)
                            .font(.title)
                        
                        if activeTab == tab {
                            Text (tab.title)
                                .font(.caption)
                                .fontWeight(.semibold)
                                .lineLimit(1)
                        }
                    }
                    .foregroundStyle(activeTab == tab ? activeForegroundColor : .black.opacity(0.8))
                    .padding(.vertical, 2)
                    .padding(.leading, 10)
                    .padding(.trailing, 15)
                    .contentShape(.rect)
                    .background {
                        if activeTab == tab {
                            Capsule()
                                .fill(activeBackgroundColor.gradient)
                                .matchedGeometryEffect(id: "ActiveTab", in: animation)
                        }
                    }
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal, 5)
        .frame(height: 50)
        .background(
            Color.white.opacity(0.7)
                .shadow(.drop(color: .black.opacity(0.08), radius: 5, x: 5, y: 5))
                .shadow(.drop(color: .black.opacity(0.06), radius: 5, x: -5, y: -5)),
            in: .capsule
        )
        
        .animation(.smooth(duration: 0.3, extraBounce: 0), value: activeTab)
    }
}

#Preview {
    AppNavigation()
}
