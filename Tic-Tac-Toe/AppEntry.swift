//
//  Tic_Tac_ToeApp.swift
//  Tic-Tac-Toe
//
//  Created by Kristian Emil Hansen Svidt on 13/04/2023.
//

import SwiftUI

@main
struct AppEntry: App {
    
    @StateObject var game = GameService()
    
    var body: some Scene {
        WindowGroup {
            StartView()
                .environmentObject(game)
        }
    }
}
