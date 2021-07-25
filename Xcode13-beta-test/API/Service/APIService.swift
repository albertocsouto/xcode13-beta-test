//
//  APIService.swift
//  Xcode13-beta-test
//
//  Created by Alberto Caamano Souto on 7/7/21.
//

import Foundation

protocol APIService {

    func signIn(data: SignIn) async throws -> HTTPURLResponse
    func signUp(data: SignUp) async throws -> HTTPURLResponse
    func game(season: Int, match: Int) async throws -> Result<Quiniela, Error>
    
}
