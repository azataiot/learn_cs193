//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Azat Yaakov on 2.09.2022.
//

import SwiftUI

@main
struct MemorizeApp: App {
    // this is a class, the game is a pointer to the class, we not change the class, we change the content of the class.
    // so game is let.
    // by default make things private and remove the private only when we needed later.
    private let game = EmojiMemoryGame()

    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
