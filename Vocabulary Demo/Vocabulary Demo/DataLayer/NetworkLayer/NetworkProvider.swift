//
//  NetworkProvider.swift
//  Vocabulary Demo
//
//  Created by remon on 08/02/2025.
//

import Foundation
import Combine

enum StatusCodes : Int{
    case statusOK = 200
}

// MARK: - Network Controller
protocol NetworkProviderProtocol: AnyObject {
    
    func get<T>(type: T.Type,
                endpoint : EndPointProtcol
    ) -> AnyPublisher<T, Error> where T: Decodable
}

final class DefaultAppNetworkProvider: NetworkProviderProtocol {
    
    func get<T: Decodable>(type: T.Type,
                           endpoint : EndPointProtcol) -> AnyPublisher<T, Error> {
        
        
        
        var request = URLRequest(url: endpoint.path)
        request.httpMethod = endpoint.method
        request.allHTTPHeaderFields = endpoint.headers
        
        let response = URLSession.shared.dataTaskPublisher(for: request)
        // confirm receiving a valid HTTP response
            .tryMap { result -> Data in
                guard let response = result.response as? HTTPURLResponse, response.statusCode == StatusCodes.statusOK.rawValue else {
                    throw URLError(.badServerResponse)
                }
                return result.data
            }
        // Decode the JSON data into model
            .decode(type: T.self, decoder: JSONDecoder())
        // Erase the publisher to AnyPublisher
            .eraseToAnyPublisher()
        
        return response
    }
    
}

