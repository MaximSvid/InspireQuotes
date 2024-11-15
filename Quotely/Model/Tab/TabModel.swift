//
//  Tab.swift
//  Quotely
//
//  Created by Maxim Svidrak on 15.11.24.
//

enum TabModel: String, CaseIterable {
    case home = "quote.bubble"
    case author = "person.2"
    case category = "square.grid.2x2"
    case inspiration = "lightbulb"
    
    var title: String {
        switch self {
        case .home: "Qoute"
        case .author: "Author"
        case .category: "Category"
        case .inspiration: "Inspiration"
        }
    }
}
