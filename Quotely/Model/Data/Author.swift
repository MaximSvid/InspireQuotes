//
//  Authors.swift
//  Quotely
//
//  Created by Maxim Svidrak on 14.11.24.
//
import Foundation

struct Author: Codable {
    var id: String
    var name: String
    var urlName: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case urlName = "slug"
    }
}
