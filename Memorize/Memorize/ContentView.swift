//
//  ContentView.swift
//  Memorize
//
//  Created by Azat Yaakov on 2.09.2022.
//

import SwiftUI

struct ContentView: View {
    static let emojisCar = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🦯", "🦽", "🦼", "🩼", "🛴", "🚲", "🛵", "🏍", "🛺", "🛞"]

    static let emojiFood = ["🌭", "🌮", "🌯", "🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐"]

    static let emojiHeart = ["❤️", "🧡", "💛", "💚", "💙", "💜", "🖤", "🤍", "🤎", "💔", "❤️‍🔥", "❤️‍🩹", "❣️"]

    // Task 5 card number is a variable in range 7..<12
    @State var emojiCount = 12
    @State var emojis = emojisCar
    @State var themeColor: Color = .red


    var body: some View {

        VStack {
            HStack {
                // Task 3. Add title Memorize!
                Text("Memorize!")
                        .font(.largeTitle)
            }
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 64))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self, content: { emoji in
                        CardView(content: emoji).aspectRatio(2 / 3, contentMode: .fit)
                    })
                }
            }
                    .foregroundColor(themeColor)
            Spacer()
            HStack {
                // Task 4. Theme choosing buttons
                Button(action: {
                    // Task 6. array content is shuffled.
                    emojis = ContentView.emojisCar.shuffled()
                    themeColor = .red
                    emojiCount = Int.random(in: 7..<12)
                }, label: {
                    VStack {
                        Image(systemName: "car").font(.largeTitle)
                        Text("Vehicles")
                    }
                })
                        .foregroundColor(.red)
                Spacer()
                // Task 7 & 8. Button including an image with SF Symbol and Text label
                Button(action: {
                    emojis = ContentView.emojiFood.shuffled()
                    themeColor = .orange
                    emojiCount = Int.random(in: 7..<12)
                }, label: {
                    VStack {
                        Image(systemName: "fork.knife").font(.largeTitle)
                        Text("Food")
                    }
                })
                        .foregroundColor(.orange)
                Spacer()
                Button(action: {
                    emojis = ContentView.emojiHeart.shuffled()
                    themeColor = .green
                    emojiCount = Int.random(in: 7..<12)
                }, label: {
                    VStack {
                        Image(systemName: "heart").font(.largeTitle)
                        Text("Heart")
                    }
                })
                        .foregroundColor(.green)
            }
                    .padding(.horizontal)
                    // Task 9 using smaller font
                    .font(.title3)

        }
                .padding()
    }

    // UI works in both portrait and landscape mode

    struct CardView: View {
        var content: String
        @State var isFaceUp: Bool = true

        var body: some View {
            ZStack {
                let shape = RoundedRectangle(cornerRadius: 20)
                if isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: 3)
                    Text(content).font(.largeTitle)
                } else {
                    shape.fill()
                }
            }
                    .onTapGesture {
                        isFaceUp = !isFaceUp
                    }
        }

    }


    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                    .previewInterfaceOrientation(.portrait)
            ContentView()
                    .preferredColorScheme(.dark)
        }
    }
}
