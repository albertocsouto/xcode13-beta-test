//
//  RegisterViewModel.swift
//  Xcode13-beta-test
//
//  Created by Alberto Caamano Souto on 2/7/21.
//

import Foundation
import Combine
import SwiftUI

class RegisterViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var name: String = ""
    @Published var lastname: String = ""
    @Published var result: String = ""

    func signUp() async throws {
        let signUpService = SignUpService()
        let signUpContent = SignUpContent(name: name, lastname: lastname, email: email, password: password)
        let signUp = SignUp(user: signUpContent)
        let response = try await signUpService.signUp(data: signUp)
        if let httpResponse = response as? HTTPURLResponse {
            if httpResponse.statusCode == 201 {
                result = "OK!"
            } else {
                result = "Failed!"
            }
        } else {
            result = "Failed!"
        }
    }
}
