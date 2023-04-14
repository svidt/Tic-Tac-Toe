//
//  GameService.swift
//  Tic-Tac-Toe
//
//  Created by Kristian Emil Hansen Svidt on 14/04/2023.
//

import Foundation

@MainActor

class GameService: ObservableObject {
    @Published var player1 = Player(gamePiece: .x, name: "Player 1")
    @Published var player2 = Player(gamePiece: .x, name: "Player 2")
    @Published var possibleMoves = Move.all
    @Published var movesTaken = [Int]()
    @Published var gameOver = false
    
    var gameType = GameType.single
    
    var currentPlayer: Player {
        if player1.isCurrent {
            return player1
        } else {
            return player2
        }
    }
    
    var gameStarter: Bool {
        player1.isCurrent || player2.isCurrent
    }
    
    var boardDisabled: Bool {
        gameOver || !gameStarted
    }
    
    func setupGame(gameType: GameType, player1Name: String, player2Name: String) {
        switch gameType {
        case .single: {
            self.gameType = .single
            player2.name = player2Name
        case .bot:
            self.gameType = .bot
        case .peer:
            self.gameType = .peer
        case .undetermined:
            break
        }
            player1.name = player1Name
        }
        
        func reset() {
            player1.isCurrent = false
            player2.isCurrent = false
            movesTaken.removeAll()
            player1.moves.removeAll()
            player2.moves.removeAll()
            gameOver = false
            possibleMoves = Move.all
        }
        
    }
    
}
