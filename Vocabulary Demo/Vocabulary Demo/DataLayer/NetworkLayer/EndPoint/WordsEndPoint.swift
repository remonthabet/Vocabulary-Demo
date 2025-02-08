//
//  MoviesEndPoint.swift
//  Vocabulary Demo
//
//  Created by remon on 08/02/2025.
//

import Foundation

enum WordsEndPoint {
    case getWords
}
//TODO: env urls
extension WordsEndPoint: EndPointProtcol {

    var body: [String:Any]? {
        return nil
    }
    
    var path: URL {
        switch self {
        case .getWords:
            return URL(string: baseURL + "words")!

        }
    }
    
    var method: String {
        switch self {
        default:
            return "GET"
        }
        
    }
    
    var headers: [String : String]? {
        return ["Authorization" : "Bearer \(Constants.TOKEN)",
                "Content-Type": "application/json"]
    }
}
