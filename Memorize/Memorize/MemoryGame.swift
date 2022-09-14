//
//  MemoryGame.swift
//  Memorize
//
//  Created by Azat Yaakov on 5.09.2022.
//

import Foundation


struct MemoryGame<CardContent> {
    // Memorize Game's state and controller.

    // in our game, we need a bunch of cards
    private(set) var cards: Array<Card>

    mutating func choose(_ card: Card) {
        // all arguments to functions are lets
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp.toggle()
        print(cards)
    }

    func index(of card: Card) -> Int {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0
    }

    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        // add numberOfPairsOfCards x2 cards to cards array.
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
    }

    struct Card: Identifiable {
        var id: Int

        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
    }

}
