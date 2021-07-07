//
//  APIService.swift
//  Xcode13-beta-test
//
//  Created by Alberto Caamano Souto on 6/7/21.
//

import Foundation

class APIServiceImpl: APIService {

    let session = URLSession.shared
    let baseURL: URL

    enum EnvironmentError: Error {
        case badURL
    }

    enum Environment {
        case develop

        func baseURL() throws -> URL {
            switch self {
            case .develop:
                guard let url = URL(string: "http://localhost:4000/api/") else {
                    throw EnvironmentError.badURL
                }
                return url
            }
        }
    }

    init(environment: Environment) {
        self.baseURL = try! environment.baseURL()
    }

    func signUp(data: SignUp) async throws -> HTTPURLResponse {
        let signUp = try JSONEncoder().encode(data)
        return try await fetchPOST(path: "user/signUp", body: signUp)
    }

    func signIn(data: SignIn) async throws -> HTTPURLResponse {
        let signIn = try JSONEncoder().encode(data)
        return try await fetchPOST(path: "user/signin", body: signIn)
    }

    private func fetchPOST(path: String, body: Data) async throws -> HTTPURLResponse {
        let url = URL(string: path, relativeTo: baseURL)!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = body
        let (_, response) = try await session.data(for: urlRequest, delegate: nil)
        return response as! HTTPURLResponse
    }
}
