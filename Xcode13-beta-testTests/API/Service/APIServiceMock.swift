//
//  APIServiceMock.swift
//  Xcode13-beta-testTests
//
//  Created by Alberto Caamano Souto on 7/7/21.
//

@testable import Xcode13_beta_test
import Foundation

// Naif mock only for playing a little bit
class APIServiceMock: APIService {

    let mockURL = URL(string: "http://localhost")!
    
    func signIn(data: SignIn) async throws -> HTTPURLResponse {
        let response: HTTPURLResponse
        if data.password == "good password" {
            response = HTTPURLResponse(url: mockURL, statusCode: 201, httpVersion: nil, headerFields: nil)!
        } else {
            response = HTTPURLResponse(url: mockURL, statusCode: 401, httpVersion: nil, headerFields: nil)!
        }
        return response
    }

    func signUp(data: SignUp) async throws -> HTTPURLResponse {
        let response: HTTPURLResponse
        if data.isComplete() {
            response = HTTPURLResponse(url: mockURL, statusCode: 201, httpVersion: nil, headerFields: nil)!
        } else {
            response = HTTPURLResponse(url: mockURL, statusCode: 400, httpVersion: nil, headerFields: nil)!
        }
        return response
    }

    func game(season: Int, match: Int) async throws -> Result<Quiniela, Error> {
        if season == 2021 && match == 1 {
            return .success(Quiniela())
        } else {
            let error = NSError(domain: "mock", code: 404, userInfo: nil)
            return .failure(error)
        }

    }
}

private extension SignUp {
    func isComplete() -> Bool {
        return !user.name.isEmpty &&
        !user.lastname.isEmpty &&
        !user.email.isEmpty &&
        !user.password.isEmpty
    }
}
