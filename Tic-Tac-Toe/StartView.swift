//
//  ContentView.swift
//  Tic-Tac-Toe
//
//  Created by Svidt on 13/04/2023.
//

import SwiftUI

struct StartView: View {
    
    @EnvironmentObject var game: GameService
    
    @State private var gameType: GameType = .undetermined
    @AppStorage("yourName") var yourName = ""
    @State private var opponentName: String = ""
    
    @FocusState private var focus: Bool
    @State private var startGame: Bool = false
    @State private var changeName: Bool = false
    @State private var newName: String = ""
    
    init(yourName: String) {
        self.yourName = yourName
    }
    
    var body: some View {
        VStack {
            Picker("Select Game", selection: $gameType) {
                Text("Select Game Type").tag(GameType.undetermined)
                Text("Two Sharing Device").tag(GameType.single)
                Text("Challenge Your Device").tag(GameType.bot)
                Text("Challenge A Friend").tag(GameType.peer)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(lineWidth: 2).foregroundColor(.accentColor))
            Text(gameType.description)
                .padding()
            VStack {
                switch gameType {
                case .single:
                    VStack {
                        TextField("Opponent Name", text: $opponentName)
                    }
                case .bot:
                    EmptyView()
                case .peer:
                    EmptyView()
                case .undetermined:
                    EmptyView()
                }
            }
            .padding()
            .textFieldStyle(.roundedBorder)
            .focused($focus)
            .frame(width: 350)
            if gameType != .peer {
                Button("Start Game") {
                    game.setupGame(gameType: gameType, player1Name: yourName, player2Name: opponentName)
                    focus = false
                    startGame.toggle()
                }
                .buttonStyle(.borderedProminent)
                .disabled(
                    gameType == .undetermined ||
                    gameType == .single && opponentName.isEmpty
                )
                Image("LaunchScreen")
                Text("Your name is \(yourName)")
                Button("Change my name") {
                    changeName.toggle()
                }
                .buttonStyle(.bordered)
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Tic-Tac-Toe")
        .fullScreenCover(isPresented: $startGame) {
            GameView()
        }
        .alert("Change Name", isPresented: $changeName, actions: {
            TextField("New name", text: $newName)
            Button("OK", role: .destructive) {
                yourName = newName
                exit(-1)
            }
            Button("Cancel", role: .cancel) {}
        }, message: {
            Text("Tapping the OK button will quit the application so you can relaunch and use your changed name.")
        })
        .inNavigationStack()
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView(yourName: "Sample")
            .environmentObject(GameService())
    }
}
