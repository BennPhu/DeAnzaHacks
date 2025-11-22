//
//  ContentView.swift
//  SecondServe
//
//  Created by Marc Rodenas Guasch on 21/11/25.
//

import SwiftUI

struct Dashboard: View {
    @State private var searchFood = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {

                // Search Bar
                TextField("Search", text: $searchFood)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                    .frame(width: 360, height: 47)

                // Banner
                Image("PearBanner")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 330, height: 100)
                    .clipped()
                    .cornerRadius(12)
            }
            .padding(.top, 24)
        }
    }
}

#Preview {
    Dashboard()
}
