//
//  MoviesRepository.swift
//  Vocabulary Demo
//
//  Created by remon on 08/02/2025.
//

import Foundation
import Combine
protocol WordsRepository {
    func getWords() async throws -> [WordEntity]
}
