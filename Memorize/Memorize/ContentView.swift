//
//  ContentView.swift
//  Memorize
//
//  Created by Azat Yaakov on 2.09.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 3)
            Text("some text")
            
        }
        .padding(.horizontal)
        .foregroundColor(.orange)
    }
}









































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .preferredColorScheme(.dark)
    }
}
