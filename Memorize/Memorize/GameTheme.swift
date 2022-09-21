//
// Created by Azat Yaakov on 21.09.2022.
//

import Foundation

// Add the formal concept of theme.

struct GameTheme<CardContent> where CardContent: Equatable {
    // Memorize game's state about the themes.

    // in this model, we hold a bunch of themes
    private(set) var themes: Array<Theme>

    private(set) var selectedTheme: Theme

    mutating func shuffle() {
        // every time we call the changeTheme func to select a random theme
        // instance from the themes.
        let themeIndex = Int.random(in: 0..<themes.count)
        selectedTheme = themes[themeIndex]
        print(selectedTheme)

    }

    init(_ fromThemes: [Theme]) {
        themes = fromThemes
        selectedTheme = themes[0]
    }

    struct Theme {
        var title: String
        var emojis: Array<CardContent>
        // Note: 4. fewer pairs of cards than the number of emoji available in that theme. so the number of pairs of cards should be a var.
        var numberOfPairsOfCards: Int
        var color: String
    }
}