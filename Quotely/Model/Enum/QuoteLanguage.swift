//
//  QuoteLanguage.swift
//  Quotely
//
//  Created by Maxim Svidrak on 13.11.24.
//

enum QouteLanguage: String {
    case motivation
    case life
    case love
    case wisdom
    case success
    case happiness
    case courage
    case friendship
    case education
    case future
    
    var localized: String {
        switch self {
        case .motivation: return "Motivation"
        case .life: return "Leben"
        case .love: return "Liebe"
        case .wisdom: return "Weisheit"
        case .success: return "Erfolg"
        case .happiness: return "Glück"
        case .courage: return "Kourage"
        case .friendship: return "Freundschaft"
        case .education: return "Bildung"
        case .future: return "Zukunft"
            
        }
    }
}
