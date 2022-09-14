//
//  MemoryGame.swift
//  Memorize
//
//  Created by Azat Yaakov on 5.09.2022.
//

import Foundation


struct MemoryGame<CardContent> where CardContent: Equatable {
    // Memorize Game's state and controller.

    // in our game, we need a bunch of cards
    private(set) var cards: Array<Card>

    private var indexOfTheOnlyFaceUpCard: Int?

    mutating func choose(_ card: Card) {
        // all arguments to functions are lets
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfTheOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
        print(cards)
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

        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }

}
