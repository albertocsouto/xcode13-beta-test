//
//  WelcomeView.swift
//  Xcode13-beta-test
//
//  Created by Alberto Caamano Souto on 2/7/21.
//

import SwiftUI

struct WelcomeView: View {

    @ObservedObject var viewModel: WelcomeViewModel

    init(viewModel: WelcomeViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            VStack {
                createShowRegisterNavigationLink()
                Button("Tap to show register") {
                    viewModel.isShowingRegisterView = true
                }.padding()
                createShowLoginNavigationLink()
                Button("Tap to show login") {
                    viewModel.isShowingLoginView = true
                }.padding()
            }
        }.navigationTitle("Welcome")
    }

    private func createShowRegisterNavigationLink() -> NavigationLink<EmptyView, RegisterView> {
        let registerView = RegisterView(viewModel: RegisterViewModel(service: APIServiceImpl(environment: .develop)))
        return NavigationLink(destination: registerView,
                              isActive:$viewModel.isShowingRegisterView) {
            EmptyView()
        }
    }

    private func createShowLoginNavigationLink() -> NavigationLink<EmptyView, LoginView> {
        let loginView = LoginView(viewModel: LoginViewModel(service: APIServiceImpl(environment: .develop)))
        return NavigationLink(destination: loginView,
                              isActive:$viewModel.isShowingLoginView) {
            EmptyView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(viewModel: WelcomeViewModel())
    }
}
