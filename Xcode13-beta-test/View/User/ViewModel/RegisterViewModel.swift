//
//  RegisterViewModel.swift
//  Xcode13-beta-test
//
//  Created by Alberto Caamano Souto on 2/7/21.
//

import Foundation
import Combine

class RegisterViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var name: String = ""
    @Published var lastname: String = ""
    @Published var result: String = ""

    let service: APIService

    var registerTask: Task<(), Error>?

    required init(service: APIService) {
        self.service = service
    }

    func signUp() async throws {
        let signUpContent = SignUpContent(name: name, lastname: lastname, email: email, password: password)
        let signUp = SignUp(user: signUpContent)
        let response = try await service.signUp(data: signUp)
        if response.statusCode == 201 {
            result = "OK!"
        } else {
            result = "Failed!"
        }
    }
}
