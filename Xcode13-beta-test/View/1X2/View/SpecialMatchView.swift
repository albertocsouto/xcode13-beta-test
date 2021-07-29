//
//  SpecialMatchView.swift
//  SpecialMatchView
//
//  Created by Alberto Caamano Souto on 25/7/21.
//

import SwiftUI

struct SpecialMatchView: View {
    @ObservedObject var viewModel: SpecialMatchViewModel

    init(viewModel: SpecialMatchViewModel) {
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
                }.frame(width: geometry.size.width * 0.65)
                HStack {
                    Button("0", role: nil) {
                        viewModel.is0Marked.toggle()
                    }
                    .buttonStyle(SpecialMatchButtonStyle(marked: viewModel.is0Marked))
                    Button("1", role: nil) {
                        viewModel.is1Marked.toggle()
                    }
                    .buttonStyle(SpecialMatchButtonStyle(marked: viewModel.is1Marked))
                    Button("2", role: nil) {
                        viewModel.is2Marked.toggle()
                    }
                    .buttonStyle(SpecialMatchButtonStyle(marked: viewModel.is2Marked))
                    Button("M", role: nil) {
                        viewModel.isMMarked.toggle()
                    }
                    .buttonStyle(SpecialMatchButtonStyle(marked: viewModel.isMMarked))
                }.frame(width: geometry.size.width * 0.3)
            }
        }
    }
}


struct SpecialMatchView_Previews: PreviewProvider {
    static var previews: some View {
        SpecialMatchView(viewModel: SpecialMatchViewModel.mock())
    }
}
