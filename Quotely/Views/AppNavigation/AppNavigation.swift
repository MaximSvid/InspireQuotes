//
//  AppNavigation.swift
//  Quotely
//
//  Created by Maxim Svidrak on 11.11.24.
//

import SwiftUI

struct AppNavigation: View {
    @State private var activeTab: TabModel = .home
    @State private var isTabBarHidden: Bool = false
    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                if #available(iOS 18, *) {
                    TabView (selection: $activeTab) {
                        Tab.init(value: .home) {
                            QuoteView()
                                .toolbarVisibility(.hidden, for: .tabBar)
                        }
                        Tab.init(value: .author) {
                            AuthorView()
                                .toolbarVisibility(.hidden, for: .tabBar)
                        }
                        Tab.init(value: .category) {
                            CategoryView()
                                .toolbarVisibility(.hidden, for: .tabBar)
                        }
                        Tab.init(value: .inspiration) {
                            InspirationView()
                                .toolbarVisibility(.hidden, for: .tabBar)
                        }
                    }
                } else {
                    TabView(selection: $activeTab) {
                        Text("Quote")
                            .tag(TabModel.home)
                            .background() {
                                if !isTabBarHidden {
                                    HideTabBar{
                                        print("Hidden")
                                        isTabBarHidden = true
                                    }
                                }
                            }
                        
                        Text("Author")
                            .tag(TabModel.author)
                            
                        
                        Text("Category")
                            .tag(TabModel.category)
                            
                        
                        Text("Inspiration")
                            .tag(TabModel.inspiration)
                            
                    }
                }
            }
            
            CustomTabBar(activeTab: $activeTab)

        }
        
    }
}

struct HideTabBar: UIViewRepresentable {
    var result: () -> ()
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        
        DispatchQueue.main.async {
            if let tabController = view.tabController {
                tabController.tabBar.isHidden = true
                result()
            }
        }
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}

extension UIView {
    var tabController: UITabBarController? {
        if let controller = sequence(first: self, next: {
            $0.next
        }).first(where: { $0 is UITabBarController }) as? UITabBarController {
            return controller
        }
        return nil
    }
}

#Preview {
    AppNavigation()
}
#Preview {
    AppNavigation()
}
