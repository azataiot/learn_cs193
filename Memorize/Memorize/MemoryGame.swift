//
//  MemoryGame.swift
//  Memorize
//
//  Created by Azat Yaakov on 5.09.2022.
//

import Foundation


struct MemoryGame<CardContent> {
    // Memorize Game's state and controller.
    
    // in our game, we need a bounch of cards
    var cards : Array<Card>
    
    func choose(_ card: Card) {
        
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int)->CardContent){
        cards = Array<Card>()
        // add numberOfPairsOfCards x2 cards to cards array.
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
    
}
