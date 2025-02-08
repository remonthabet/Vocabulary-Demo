//
//  GetNowPlayingUseCase.swift
//  Vocabulary Demo
//
//  Created by remon on 08/02/2025.
//

import Foundation
import Combine
struct GetWordsUseCase {
    private let wordsRepository: WordsRepository

    init(wordsRepository: WordsRepository = MockWordsRepoImp()) {
        self.wordsRepository = wordsRepository
    }
    
    func fetch() async throws -> [WordEntity] {
        return try await wordsRepository.getWords()
    }
}
