//
//  1X2View.swift
//  1X2View
//
//  Created by Alberto Caamano Souto on 23/7/21.
//

import SwiftUI

struct QuinielaView: View {

    @ObservedObject var viewModel: QuinielaViewModel

    init(viewModel: QuinielaViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(viewModel.betModels, id: \.self) { betModel in
                        if betModel.isSpecial {
                            SpecialMatchView(viewModel: betModel)
                        } else {
                            MatchView(viewModel: betModel)
                        }
                    }
                }
            }
        }
        .navigationTitle(viewModel.title)
        .onAppear() {
            viewModel.getCurrentGame()
        }.onReceive(viewModel.$status) { status in
            print("Status!: \(status)")
        }
        .alert(isPresented: $viewModel.showingError) {
            Alert(title: Text("Server info"),
                  message: Text("Service not available"),
                  dismissButton: .default(Text("Ok")))
        }
    }
}

struct QuinielaView_Previews: PreviewProvider {
    static var previews: some View {
        QuinielaView(viewModel: QuinielaViewModel(service: APIServiceImpl(environment: .develop)))
    }
}
