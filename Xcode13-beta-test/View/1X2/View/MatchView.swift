//
//  BetView.swift
//  BetView
//
//  Created by Alberto Caamano Souto on 22/7/21.
//

import SwiftUI

struct MatchView: View {

    @ObservedObject var viewModel: MatchViewModel

    init(viewModel: MatchViewModel) {
        self.viewModel = viewModel
    }

    let font = Font.system(size: 12)

    var body: some View {
        GeometryReader { geometry in
            HStack {
                HStack {
                    Text(viewModel.team1)
                        .padding()
                        .foregroundColor(.orange)
                        .font(font)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)

                    Text(viewModel.team2)
                        .padding()
                        .foregroundColor(.orange)
                        .font(font)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                }.frame(width: geometry.size.width * 0.7)

                HStack {
                    Button("1", role: nil) {

                    }
                    .buttonStyle(MatchButtonStyle())
                    Button("X", role: nil) {

                    }
                    .buttonStyle(MatchButtonStyle())
                    Button("2", role: nil) {

                    }
                    .buttonStyle(MatchButtonStyle())
                }.frame(width: geometry.size.width * 0.3)
            }
        }
    }
}


struct BetView_Previews: PreviewProvider {
    static var previews: some View {
        MatchView(viewModel: MatchViewModel.mockViewModel())
    }
}

private extension MatchViewModel {
    static func mockViewModel() -> MatchViewModel {
        let viewModel = MatchViewModel()
        viewModel.team1 = "Barcelona"
        viewModel.team2 = "Real Madrid"
        viewModel.is1Marked = true
        return viewModel
    }
}


