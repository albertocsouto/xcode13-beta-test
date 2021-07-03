//
//  SignIn.swift
//  Xcode13-beta-test
//
//  Created by Alberto Caamano Souto on 3/7/21.
//

import Foundation

struct SignIn: Codable {
    var user: SignInContent
}

struct SignInContent: Codable {
    var email: String
    var password: String
}
