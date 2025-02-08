//
//  EndPoint.swift
//  Vocabulary Demo
//
//  Created by remon on 08/02/2025.
//

import Foundation
protocol EndPointProtcol {
    
    var baseURL: String { get }
    
    var path: URL { get }
    
    var method: String { get }
    
    var body: [String: Any]? { get }
    
    var headers: [String : String]? { get }
}

extension EndPointProtcol {
    
    var baseURL: String {
        return AppEnvironment.apiURL
    }
}
