//
//  ContentView.swift
//  SecondServe
//
//  Created by Marc Rodenas Guasch on 21/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        Image("foodBanana").resizable().aspectRatio(contentMode: .fit).cornerRadius(25).padding()
        
        Text("Banana")
    }
}

#Preview {
    ContentView()
}
