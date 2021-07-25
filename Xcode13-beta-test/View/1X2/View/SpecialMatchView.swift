//
//  SpecialMatchView.swift
//  SpecialMatchView
//
//  Created by Alberto Caamano Souto on 25/7/21.
//

import SwiftUI

struct SpecialMatchView: View {
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
                        .foregroundColor(.blue)
                        .font(font)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    Text(viewModel.team2)
                        .padding()
                        .foregroundColor(.blue)
                        .font(font)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                }.frame(width: geometry.size.width * 0.7)
                HStack {
                    Button("1", role: nil) {

                    }
                    .buttonStyle(SpecialMatchButtonStyle())
                    Button("X", role: nil) {

                    }
                    .buttonStyle(SpecialMatchButtonStyle())
                    Button("2", role: nil) {

                    }
                    .buttonStyle(SpecialMatchButtonStyle())
                }.frame(width: geometry.size.width * 0.3)
            }
        }
    }
}


struct SpecialMatchView_Previews: PreviewProvider {
    static var previews: some View {
        SpecialMatchView(viewModel: MatchViewModel.mockViewModel())
    }
}

private extension MatchViewModel {
    static func mockViewModel() -> MatchViewModel {
        let viewModel = MatchViewModel()
        viewModel.team1 = "Barcelona"
        viewModel.team2 = "Real Madrid"
        viewModel.is1Marked = true
        viewModel.isSpecial = true
        return viewModel
    }
}
