//
//  NetworkManager.swift
//  HomBakery-team7-m
//
//  Created by Linda on 01/01/2026.
//

import Foundation

protocol NetworkManaging {
    func request<T: Decodable>(_ request: URLRequest) async throws -> T
}

final class NetworkManager: NetworkManaging {
    func request<T: Decodable>(_ request: URLRequest) async throws -> T {
        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse,
              200..<300 ~= httpResponse.statusCode else {
            throw NetworkError.invalidData
        }

        return try JSONDecoder().decode(T.self, from: data)
    }
}
