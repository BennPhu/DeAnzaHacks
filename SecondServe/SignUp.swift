//
//  LogIn.swift
//  SecondServe
//
//  Created by Marc Rodenas Guasch on 21/11/25.
//

import SwiftUI

struct LogIn: View {
    @State private var SignUpEmail: String = ""
    @State private var SignUpPassword: String = ""
    var body: some View {
        ZStack {
            
            //General Info Text
            Text("Second Serve")
                .offset(x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/-100.0/*@END_MENU_TOKEN@*/)
                .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
            Text("Create an account")
                .offset(x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: -20)
                .font(.system(size: 19, design: .rounded))
                .bold()
            Text("Enter your email to sign up for this app")
                .offset(x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 10)
                .font(.subheadline)
            
            //TEXT BOX & SUBMIT
            TextField("email@‎domain.com", text: $SignUpEmail)
                .frame(width: 330, height: 47.0)
                .padding(26.0)
                .textFieldStyle(.roundedBorder)
                .offset(x:0.0, y:75.0)
            TextField("password", text: $SignUpPassword)
                .frame(width: 330, height: 47.0)
                .padding(26.0)
                .textFieldStyle(.roundedBorder)
                .offset(x:0.0, y:120.0)
            
            Button("Continue") {
                // INCLUDE ANY CONTINUE ACTIONS HERE --> this is for deepak
            }.padding(/*@START_MENU_TOKEN@*/.all, 8.0/*@END_MENU_TOKEN@*/).frame(width: 330.0, height: 47.0).background(Color.black).foregroundColor(.white).font(.system(size: 19, design: .rounded)).clipShape(RoundedRectangle(cornerRadius: 10)).offset(x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/185.0/*@END_MENU_TOKEN@*/)
        }
        
        HStack {
            // Thsi is for the or visualizer skip this area
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray.opacity(0.4))

            Text("OR")
                .font(.caption)
                .foregroundColor(.gray)

            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray.opacity(0.4))
            
        }.padding(.top, 200) // Adds 50 points of padding to the top
        
        VStack {
            // Continue with Google or Apple Buttons
            
            Button("Continue with Google") {
                // INCLUDE ANY CONTINUE ACTIONS HERE --> this is for deepak
            }.padding(/*@START_MENU_TOKEN@*/.all, 8.0/*@END_MENU_TOKEN@*/).frame(width: 330.0, height: 47.0).background(Color.gray.opacity(0.3)).foregroundColor(.black).font(.system(size: 19, design: .rounded)).clipShape(RoundedRectangle(cornerRadius: 10)).offset(x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
            Button("Continue with Apple") {
                // INCLUDE ANY CONTINUE ACTIONS HERE --> this is for deepak
            }.padding(/*@START_MENU_TOKEN@*/.all, 8.0/*@END_MENU_TOKEN@*/).frame(width: 330.0, height: 47.0).background(Color.gray.opacity(0.3)).foregroundColor(.black).font(.system(size: 19, design: .rounded)).clipShape(RoundedRectangle(cornerRadius: 10)).offset(x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 10)
        
        //TOS Agreement (idk if we want to keep this or not)
        Text("By clicking continue, you agree to our Terms of Service and Privacy Policy")
            .multilineTextAlignment(.center)
            .offset(x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 55)
            .font(.caption)
        
    }
    
}

#Preview {
    LogIn()
}
