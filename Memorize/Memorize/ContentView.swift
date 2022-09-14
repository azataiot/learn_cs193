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

        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 64))]) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card).aspectRatio(2 / 3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                }
            }
        }
                .foregroundColor(.red)
                .padding(.horizontal)
    }
}


struct CardView: View {
    let card: MemoryGame<String>.Card

    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
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
