//
//  StringExtensions.swift
//  Quotely
//
//  Created by Maxim Svidrak on 13.11.24.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
}
