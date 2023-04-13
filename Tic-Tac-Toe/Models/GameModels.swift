//
//  GameModels.swift
//  Tic-Tac-Toe
//
//  Created by Kristian Emil Hansen Svidt on 13/04/2023.
//

import Foundation

enum GameType {
    case single, bot, peer, undetermined
    
    var description: String {
        switch self {
        case .single:
            return "Share your iPhone/iPad and play against a friend."
        case .bot:
            return "Play against this iPhone/iPad."
        case .peer:
            return "Invite someone near you who has this app runnning to play."
        case .undetermined:
            return ""
        }
    }
}
