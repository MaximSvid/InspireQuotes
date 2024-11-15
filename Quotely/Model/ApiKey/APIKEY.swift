//
//  APIKEY.swift
//  Quotely
//
//  Created by Maxim Svidrak on 14.11.24.
//

import SwiftUI

var APIKEY: String {
    
    guard let filePath = Bundle.main.path(forResource: "config", ofType: "plist") else {
        return ""
    }
    
    let plist = NSDictionary(contentsOfFile: filePath)
    
    guard let apiKey = plist?.object(forKey: "API_KEY_AUTHORS") as? String else {
        return ""
    }
    
    return apiKey
}
