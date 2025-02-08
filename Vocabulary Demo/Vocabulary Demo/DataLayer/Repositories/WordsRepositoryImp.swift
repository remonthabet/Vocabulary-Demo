//
//  MoviesRepositoryImp.swift
//  Vocabulary Demo
//
//  Created by remon on 08/02/2025.
//

import Foundation
import Combine
struct WordsRepositoryImp : WordsRepository {

    private let provider: NetworkProviderProtocol

    init(provider: NetworkProviderProtocol = DefaultAppNetworkProvider()) {
        self.provider = provider
    }


    func getWords() async throws -> [WordEntity] {
        let endpoint = WordsEndPoint.getWords
        let response = try await provider.get(type: [WordEntity].self, endpoint: endpoint).asAsync()
        return response
    }

}
