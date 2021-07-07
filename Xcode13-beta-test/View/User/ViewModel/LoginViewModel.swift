//
//  RegisterViewModel.swift
//  Xcode13-beta-test
//
//  Created by Alberto Caamano Souto on 2/7/21.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var result: String = ""

    let service: APIService

    required init(service: APIService) {
        self.service = service
    }

    func signIn() async throws {
        let signIn = SignIn(email: email, password: password)
        let response = try await service.signIn(data: signIn)
        if response.statusCode == 201 {
            result = "OK!"
        } else {
            result = "Failed!"
        }
    }
}
