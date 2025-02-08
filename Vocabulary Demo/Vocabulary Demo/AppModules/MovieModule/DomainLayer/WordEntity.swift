//
//  MovieEntity.swift
//  Vocabulary Demo
//
//  Created by remon on 08/02/2025.
//

import Foundation

struct WordEntity: Codable, Identifiable {
    var id = UUID()
    let word: String
    let definition: String
}

