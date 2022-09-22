//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Azat Yaakov on 5.09.2022.
//

// noteL:https://www.youtube.com/watch?v=jlnnxMkdlAk

import SwiftUI

class EmojiMemoryGame: ObservableObject {

    init() {
        theme = EmojiMemoryGame.themes.randomElement()! // Required Task 11
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }

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

    static func createTheme(_ title: String, _ emojis: [String]) -> Theme {
        // just pick a random color
        let colorIndex = Int.random(in: 0..<colors.count)
        let randomColor = colors[colorIndex]

        // just show random pairs of cards
        let randomNumberOfPairsOfCards = Int.random(in: 1..<emojis.count)

        return Theme(title: title, emojis: emojis, numberOfPairsOfCards: randomNumberOfPairsOfCards, color: randomColor)
    }

    static var themes: Array<Theme> = [
        createTheme("Vehicles", vehicleEmojis),
        createTheme("Animals", animalEmojis),
        createTheme("Food", foodEmojis),
        createTheme("Hearts", heartEmojis),
        createTheme("Sports", sportsEmojis),
        createTheme("Weather", weatherEmojis),
    ]

    static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairsOfCards) { pairIndex in
            theme.emojis[pairIndex]
        }
    }

    @Published private var model: MemoryGame<String>

    private var theme: Theme

    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }

    // for UI

    var themeName: String {
        theme.title
    }

    var themeColor: Color {
        switch theme.color {
        case "black":
            return .black
        case "gray":
            return .gray
        case "red":
            return .red
        case "green":
            return .green
        case "blue":
            return .blue
        case "orange":
            return .orange
        case "yellow":
            return .yellow
        case "pink":
            return .pink
        case "purple":
            return .purple
        default:
            return .red
        }
    }

    // MARK: - Intent(s)

    func choose(_ card: MemoryGame<String>.Card) {
        // simply call our models choose. this can be a database operation or a fetch api data operation etc.
        objectWillChange.send()
        model.choose(card)
    }

    func newGame() {
        theme = EmojiMemoryGame.themes.randomElement()! // Required Task 11
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }

}
