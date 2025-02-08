//
//  MockMovieRepoImp.swift
//  Vocabulary Demo
//
//  Created by remon on 08/02/2025.
//

import Foundation
struct MockWordsRepoImp : WordsRepository {
    func getWords() async throws -> [WordEntity] {
        return [
            WordEntity(word: "Ephemeral", definition: "Lasting for a very short time."),
            WordEntity(word: "Luminous", definition: "Full of or shedding light; bright or shining."),
            WordEntity(word: "Serendipity", definition: "The occurrence of events by chance in a happy way."),
            WordEntity(word: "Ebullient", definition: "Cheerful and full of energy."),
            WordEntity(word: "Pernicious", definition: "Having a harmful effect, especially in a subtle way.")
        ]
    }
}
