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
                }.frame(width: geometry.size.width * 0.65)

                HStack {
                    Button("1", role: nil) {
                        viewModel.is1Marked.toggle()
                    }
                    .buttonStyle(MatchButtonStyle(marked: viewModel.is1Marked))
                    Button("X", role: nil) {
                        viewModel.isXMarked.toggle()
                    }
                    .buttonStyle(MatchButtonStyle(marked: viewModel.isXMarked))
                    Button("2", role: nil) {
                        viewModel.is2Marked.toggle()
                    }
                    .buttonStyle(MatchButtonStyle(marked: viewModel.is2Marked))
                }.frame(width: geometry.size.width * 0.35)
            }
        }
    }
}


struct BetView_Previews: PreviewProvider {
    static var previews: some View {
        MatchView(viewModel: MatchViewModel.mock())
    }
}
