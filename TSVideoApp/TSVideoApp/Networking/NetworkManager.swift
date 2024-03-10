//
//  NetworkManager.swift
//  TSVideoApp
//
//  Created by Viswa bharath on 07/03/24.
//

import Foundation
import Combine

struct APIPath {
    static let feed     = "/feed"
    static let apipost  = "/feed/3"
    static let profile  = "/profile"
    static let base     = "https://my-json-server.typicode.com/BharathBob/demo"
}

class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = APIPath.base

    func request<T: Decodable>(_ endpoint: String, method: String = "GET") -> AnyPublisher<T, Error> {
        guard let url = URL(string: baseURL + endpoint) else {
            return Fail(error: NetworkError.invalidURL)
                .eraseToAnyPublisher()
        }

        var request = URLRequest(url: url)
        request.httpMethod = method

        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse,
                      200..<300 ~= httpResponse.statusCode else {
                    throw NetworkError.invalidResponse
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

