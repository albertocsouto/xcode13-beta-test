//
//  RegisterView.swift
//  Xcode13-beta-test
//
//  Created by Alberto Caamano Souto on 2/7/21.
//

import SwiftUI

struct RegisterView: View {

    @ObservedObject var viewModel: RegisterViewModel

    init(viewModel: RegisterViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            VStack {
                List {
                    TextField("Name", text: $viewModel.name)
                        .textFieldStyle(FormTextFieldStyle())
                        .textContentType(.name)
                    TextField("Last name", text: $viewModel.lastname)
                        .textFieldStyle(FormTextFieldStyle())
                        .textContentType(.familyName)
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
                Button("Register") {
                    async {
                        try? await viewModel.register()
                    }
                }.padding()
                    .buttonStyle(BorderedButtonStyle())
            }

        }.navigationTitle("Register")
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(viewModel: RegisterViewModel())
    }
}
