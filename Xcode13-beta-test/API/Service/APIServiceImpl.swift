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
        return try await fetchPOST(path: "user/signup", body: signUp)
    }

    func signIn(data: SignIn) async throws -> HTTPURLResponse {
        let signIn = try JSONEncoder().encode(data)
        return try await fetchPOST(path: "user/signin", body: signIn)
    }

    func game(season: Int, match: Int) async throws -> Result<Quiniela, Error> {
        var queryItems = [URLQueryItem]()
        queryItems.append(URLQueryItem(name: "season", value: String(season)))
        queryItems.append(URLQueryItem(name: "game_number", value: String(match)))
        let (data, _) = try await fetchGET(path: "game/quiniela", queryItems: queryItems)
        let stringData = String(data: data, encoding: .utf8)
        print(stringData!)
        let result = Result { try JSONDecoder().decode(Quiniela.self, from: data) }
        return result
    }

    private func fetchGET(path: String, queryItems: [URLQueryItem]?) async throws -> (Data, HTTPURLResponse) {
        let url = URL(string: path, relativeTo: baseURL)!
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = queryItems
        let urlWithQueryItems = urlComponents?.url
        var urlRequest = URLRequest(url: urlWithQueryItems!)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let (data, response) = try await session.data(for: urlRequest, delegate: nil)
        return (data, response as! HTTPURLResponse)
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
