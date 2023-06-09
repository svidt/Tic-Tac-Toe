//
//  SquareView.swift
//  Tic-Tac-Toe
//
//  Created by Kristian Emil Hansen Svidt on 14/04/2023.
//

import SwiftUI

struct SquareView: View {
    
    @EnvironmentObject var game: GameService
    
    let index: Int
    
    var body: some View {
        Button {
            if !game.isThinking {
                game.makeMove(at: index)
            }
            game.makeMove(at: index)
        } label: {
            game.gameBoard[index].image
                .resizable()
                .frame(width: 100, height: 100)
        }
        .disabled(game.gameBoard[index].player != nil)
        .foregroundColor(.primary)
    }
}

struct SquareView_Previews: PreviewProvider {
    static var previews: some View {
        SquareView(index: 1)
            .environmentObject(GameService())
    }
}
