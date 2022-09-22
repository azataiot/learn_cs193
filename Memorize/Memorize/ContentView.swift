//
//  ContentView.swift
//  Memorize
//
//  Created by Azat Yaakov on 2.09.2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    var body: some View {
        VStack {
            Text(
                    viewModel.themeName
            ).font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards) { card in
                        // bag of lego view!
                        CardView(card: card)
                                .aspectRatio(2 / 3, contentMode: .fit)
                                .onTapGesture {
                                    // ask VM to express User intent
                                    viewModel.choose(card)
                                }
                    }
                }
            }
                    .foregroundColor(viewModel.themeColor)
                    .padding(.horizontal)
            Spacer()
            Button(action: {
                viewModel.newGame()
            }, label: {
                Text("New Game")
            })
                    .padding()
        }
    }
}


// View that shows what the card looks like

struct CardView: View {
    let card: MemoryGame<String>.Card

    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {

                shape.opacity(0)
            } else {
                shape.fill()
            }
        }

    }

}


struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
                .previewInterfaceOrientation(.portrait)
        ContentView(viewModel: game)
                .preferredColorScheme(.dark)
    }
}
