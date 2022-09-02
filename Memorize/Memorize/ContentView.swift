//
//  ContentView.swift
//  Memorize
//
//  Created by Azat Yaakov on 2.09.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // the body is calculated by running or executing the function
        Text("Hello CS193!") // Text is just a struct that behavis like a view.
            .foregroundColor(.orange)
            .padding()
    }
    
    
}









































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .preferredColorScheme(.dark)
    }
}
