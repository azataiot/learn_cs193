//
//  EmojiMemoryGame.swift
//  Memorize
//  ViewModel of the Memorize App
//  Created by Azat Yaakov on 5.09.2022.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    // our ViewModel is going to create it's own model that will specifically to the UI.
    // making our model private makes our VM as a gatekeeper
    
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🦯", "🦽", "🦼", "🩼", "🛴", "🚲", "🛵", "🏍", "🛺", "🛞"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 9) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    private var model = createMemoryGame()
    
    
    var cards: Array<Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: Card) {
        // simply call our models choose. this can be a database operation or a fetch api data operation etc.
        objectWillChange.send()
        model.choose(card)
    }
}
