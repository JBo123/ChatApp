//
//  ChatMessage.swift
//  ChatApp
//
//  Created by Jakub Klucký on 25.07.2023.
//

import Foundation

struct ChatMessage: Codable, Identifiable, Equatable {
    
    var documentId: String?
    
    let lext: String
    let uid: String
    let dateCreated = Date()
    let displayName: String
    
}
