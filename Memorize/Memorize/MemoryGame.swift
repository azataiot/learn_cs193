//
//  MemoryGame.swift
//  Memorize
//  Model of The Game
//  Created by Azat Yaakov on 5.09.2022.
//

import Foundation


struct MemoryGame<CardContent> where CardContent: Equatable {
    // Memorize Game's state and controller.
    // in our game, we need a bunch of cards
    private(set) var cards: Array<Card>
    private var indexOfTheOnlyFaceUpCard: Int?{
        get { cards.indices.filter({cards[$0].isFaceUp}).oneAndOnly }
        set { cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) }}
        // all other cards except the new opened one face down
    }
    
    
    // this func chooose can not be private because we want to expose it
    // internal is the default and it means we can use it anywhere inside the app.
    internal mutating func choose(_ card: Card) {
        // all arguments to functions are lets
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOnlyFaceUpCard = chosenIndex
            }
        }
        
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        // add numberOfPairsOfCards x2 cards to cards array.
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp = true
        var isMatched = false
        var content: CardContent
    }
    
}



extension Array {
    // Array's dont care is called Element
    var oneAndOnly:Element? {   // we want one and only, if only return it else return nil
        if self.count == 1 {
            return self.first
        } else {
            return nil
        }
    }
}
