import SwiftUI

struct Dashboard: View {
    @State private var searchFood = ""
    
    var body: some View {
        TabView {
            // home tab
            ZStack {
                
                // scrollable feed goes here
                ScrollView {
                    VStack(spacing: 20) {
                        // General search / banners
                        TextField("Search", text: $searchFood)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal)
                            .frame(width: 360, height: 47)
                        Image("PearBanner")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 330, height: 100)
                            .clipped()
                            .cornerRadius(12)
                    }
                    .padding(.top, 24)
                }

                // bottom right cart button
                VStack {
                    Spacer()  // pushes it to very bottom
                    
                    HStack {
                        Spacer() // pushes it to the right
                        
                        Button(action: {
                            print("Open cart")
                        }) {
                            Image(systemName: "cart.fill")
                                .font(.system(size: 20))
                                .padding()
                                .background(Color.black)
                                .foregroundColor(.white)
                                .clipShape(Circle())
                                .shadow(radius: 4)
                        }
                        .padding(.bottom, 30)
                        .padding(.trailing, 20)
                    }
                }
            }
            // actual home icon bttn
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            
            
            // rest of the icon + their pages
            Text("Sell")
                .tabItem {
                    Image(systemName: "dollarsign")
                    Text("Sell")
                }

            Text("Donation")
                .tabItem {
                    Image(systemName: "gift")
                    Text("Donation")
                }

            Text("Cart")
                .tabItem {
                    Image(systemName: "cart.fill")
                    Text("Cart")
                }

            Text("Profile")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
    }
}

#Preview {
    Dashboard()
}
