//
//  RegisterViewModel.swift
//  Xcode13-beta-test
//
//  Created by Alberto Caamano Souto on 2/7/21.
//

import Foundation
import Combine
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var result: String = ""

    func login() async throws {
        let signInService = SignInService()
        let signIn = SignIn(email: email, password: password)
        let response = try await signInService.signIn(data: signIn)
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
