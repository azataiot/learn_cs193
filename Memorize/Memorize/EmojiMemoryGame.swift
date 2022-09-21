//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Azat Yaakov on 5.09.2022.
//

// noteL:https://www.youtube.com/watch?v=jlnnxMkdlAk

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    // our ViewModel is going to create it's own model that will specifically to the UI.
    // making our model private makes our VM as a gatekeeper

    // 2.8 support at least 6 different themes.
    static private let vehicleEmojis = ["🚗", "🛴", "✈️", "🛵", "⛵️", "🚎", "🚐", "🚛", "🛻", "🏎", "🚂", "🚊", "🚀", "🚁", "🚢", "🛶", "🛥", "🚞", "🚟", "🚃"]
    static private let animalEmojis = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐵"]
    static private let foodEmojis = ["🍔", "🥐", "🍕", "🥗", "🥟", "🍣", "🍪", "🍚", "🍝", "🥙", "🍭", "🍤", "🥞", "🍦", "🍛", "🍗"]
    static private let heartEmojis = ["❤️", "🧡", "💛", "💚", "💙", "💜"]
    static private let sportsEmojis = ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🏉", "🥏", "🏐", "🎱", "🏓", "🏸", "🏒", "🥊", "🚴‍♂️", "🏊", "🧗‍♀️", "🤺", "🏇", "🏋️‍♀️", "⛸", "⛷", "🏄", "🤼"]
    static private let weatherEmojis = ["☀️", "🌪", "☁️", "☔️", "❄️"]
    static private let colors = ["black", "gray", "red", "green", "blue", "orange", "yellow", "pink", "purple", "fuchsia", "beige", "gold"]

    static let emojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🦯", "🦽", "🦼", "🩼", "🛴", "🚲", "🛵", "🏍", "🛺", "🛞"]

    static func createTheme(_ title: String, _ emojis: [String]) -> GameTheme<String>.Theme {
        // just pick a random color
        let colorIndex = Int.random(in: 0..<colors.count)
        let randomColor = colors[colorIndex]

        // just show random pairs of cards
        let randomNumberOfPairsOfCards = Int.random(in: 1..<emojis.count)

        return GameTheme<String>.Theme(title: title, emojis: emojis, numberOfPairsOfCards: randomNumberOfPairsOfCards, color: randomColor)

    }

    static func generateThemes() -> GameTheme<String> {
        return GameTheme<String>(themes)
    }

    private(set) var themeModel: GameTheme<String> = generateThemes()

    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: selectedTheme.numberOfPairsOfCards) { pairIndex in
            selectedTheme.emojis[pairIndex]
        }
    }

    private(set) var model: MemoryGame<String> = createMemoryGame()


    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }

    static var themes: Array<GameTheme<String>.Theme> {
        var themes = [GameTheme<String>.Theme]()
        themes.append(createTheme("Vehicles", vehicleEmojis))
        themes.append(createTheme("Animals", animalEmojis))
        themes.append(createTheme("Food", foodEmojis))
        themes.append(createTheme("Hearts", heartEmojis))
        themes.append(createTheme("Sports", sportsEmojis))
        themes.append(createTheme("Weather", weatherEmojis))
        return themes
    }

    static var selectedTheme: GameTheme<String>.Theme {
        themeModel.selectedTheme
    }

    // MARK: - Intent(s)

    func shuffleTheme() {
        objectWillChange.send()
        themeModel.shuffle()
    }

    func choose(_ card: MemoryGame<String>.Card) {
        // simply call our models choose. this can be a database operation or a fetch api data operation etc.
        objectWillChange.send()
        model.choose(card)
    }
}
