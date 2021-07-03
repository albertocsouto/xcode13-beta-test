//
//  User.swift
//  Xcode13-beta-test
//
//  Created by Alberto Caamano Souto on 2/7/21.
//

import Foundation

struct SignUp: Codable {
    var user: SignUpContent
}

struct SignUpContent: Codable {
    var name: String
    var lastname: String
    var email: String
    var password: String
}
