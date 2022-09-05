//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Azat Yaakov on 5.09.2022.
//

import SwiftUI

class EmojiMemoryGame {
    // our ViewModel is going to create it's own model that will specifically to the UI.
    // making our model private makes our VM as a gatekeeper
    
    static let emojis = ["🚗","🚕","🚙","🚌","🚎","🏎","🚓","🚑","🚒","🚐","🛻","🚚","🚛","🚜","🦯","🦽","🦼","🩼","🛴","🚲","🛵","🏍","🛺","🛞"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    private var model: MemoryGame<String> = createMemoryGame()
    
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
