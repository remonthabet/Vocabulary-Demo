//
//  Extentions.swift
//  Vocabulary Demo
//
//  Created by remon on 08/02/2025.
//

import Foundation
import Combine
// Extension to convert Combine Publisher to Async/Await
extension Publisher {
    func asAsync() async throws -> Output {
        try await withCheckedThrowingContinuation { continuation in
            var cancellable: AnyCancellable?
            cancellable = self.sink(
                receiveCompletion: { completion in
                    if case .failure(let error) = completion {
                        continuation.resume(throwing: error)
                    }
                    cancellable?.cancel()
                },
                receiveValue: { value in
                    continuation.resume(returning: value)
                    cancellable?.cancel()
                }
            )
        }
    }
}
