//
//  String+Extentions.swift
//  ChatApp
//
//  Created by Jakub Klucký on 29.06.2023.
//

import Foundation

extension String{
    
    var isEmptyOrWhiteSpace: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
}
