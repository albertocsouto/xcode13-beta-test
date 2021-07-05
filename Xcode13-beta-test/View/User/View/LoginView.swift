//
//  LoginView.swift
//  Xcode13-beta-test
//
//  Created by Alberto Caamano Souto on 2/7/21.
//

import SwiftUI

struct LoginView: View {

    @ObservedObject var viewModel: LoginViewModel

    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            VStack {
                List {
                    TextField("Email", text: $viewModel.email)
                        .textFieldStyle(FormTextFieldStyle())
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(FormTextFieldStyle())
                        .textContentType(.newPassword)
                }.listStyle(.plain)
                Text(viewModel.result)
                    .padding()
                Button("Login") {
                    async {
                        try? await viewModel.signIn()
                    }
                }.padding()
                    .buttonStyle(BorderedButtonStyle())
            }

        }.navigationTitle("Login")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel())
    }
}
