//
//  NetworkError.swift
//  TSVideoApp
//
//  Created by Viswa bharath on 10/03/24.
//

import Foundation

enum NetworkError: Error {
    case requestFailed
    case invalidURL
    case invalidResponse
    case serverErrorResponse(message: String, code: Int)
    
    var localizedDescription: String {
        switch self {
        case .invalidURL : return "Invalid URL"
        case .invalidResponse : return "Invalid Response"
        case .requestFailed: return "Something went wrong"
         case let .serverErrorResponse(message, _):
            return message
        }
    }
    
    var serverErrorCode: Int {
        switch self {
        case let .serverErrorResponse(_, errorCode):
            return errorCode
        default:
            return 500
        }
    }
}
