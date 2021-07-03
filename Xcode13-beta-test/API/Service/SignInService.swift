//
//  SignInService.swift
//  Xcode13-beta-test
//
//  Created by Alberto Caamano Souto on 3/7/21.
//

import Foundation

struct SignInService {

    let session = URLSession.shared

    // Sample:
    // curl -vvv  -X  POST http://localhost:4000/api/users/signin -H "Content-Type: application/json" -d '{"user": {"email": "users11084d@business.com", "password": "1234568"}}'

    func signIn(data: SignIn) async throws -> URLResponse {
        let url = URL(string: "http://localhost:4000/api/users/signin")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = try JSONEncoder().encode(data)
        let (_, response) = try await session.data(for: urlRequest, delegate: nil)
        return response
    }
}