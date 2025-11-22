//
//  LogIn.swift
//  SecondServe
//
//  Created by Marc Rodenas Guasch on 21/11/25.
//

import SwiftUI

struct LogIn: View {
    var body: some View {
        ZStack {
            
            //General Info Text
            Text("Second Serve")
                .offset(x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/-290.0/*@END_MENU_TOKEN@*/)
                .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
            Text("Create an account")
                .offset(x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: -174)
                .font(.system(size: 19, design: .rounded))
                .bold()
            Text("Enter your email to sign up for this app")
                .offset(x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: -145)
                .font(.subheadline)
        }
    }
}

#Preview {
    LogIn()
}
