//
//  Inspiration.swift
//  Quotely
//
//  Created by Maxim Svidrak on 15.11.24.
//

struct Inspiration: Codable {
    var id: String
    var urls: Images
}


struct Images: Codable {
    var regular: String
}
