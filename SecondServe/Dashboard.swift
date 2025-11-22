import SwiftUI
import MapKit

struct Dashboard: View {
    @State private var searchFood = ""
    @State private var showCart = false
    
    var body: some View {
        TabView {
            
            ZStack {
                // MAIN SCROLL FEED
                ScrollView {
                    VStack(spacing: 20) {
                        
                        // top banner
                        Image("PearBanner")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 330, height: 100)
                            .clipped()
                            .cornerRadius(12)
                            .padding(.top, 24)
                        
                        // feed sections
                        // remember: change 1...10 corresponding to however many items we have
                        ForEach(1...10, id: \.self) { _ in
                            Divider()
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                    CardView(title: "Banana", backgroundColor: Color.gray.gradient)
                                        .frame(width: 170, height: 200)
                                    CardView(title: "Orange", backgroundColor: Color.gray.gradient)
                                        .frame(width: 185, height: 200)
                                    CardView(title: "Yogurt", backgroundColor: Color.gray.gradient)
                                        .frame(width: 185, height: 200)
                                    CardView(title: "Milk", backgroundColor: Color.gray.gradient)
                                        .frame(width: 185, height: 200)
                                }
                                .padding(.leading, 20)
                                .padding(.trailing, 10)
                            }
                            .frame(height: 115)
                        }
                        
                        Text("You've reached the end!")
                            .multilineTextAlignment(.center)
                            .font(.caption)
                            .padding(.top, 12)
                    }
                }
                
                // search bar alongside cart
                VStack {
                    Spacer()
                    
                    HStack(spacing: 12) {
                        // search bar
                        TextField("Search", text: $searchFood)
                            .padding(.horizontal, 12)
                            .frame(height: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.black.opacity(0.85))
                            )
                            .foregroundColor(.white)
                            .foregroundStyle(.white.opacity(0.9))
                            .padding(.leading, 20)
                        
                        // cart button
                        Button(action: {
                            showCart = true
                        }) {
                            Image(systemName: "cart.fill")
                                .font(.system(size: 20))
                                .padding()
                                .background(Color.black)
                                .foregroundColor(.white)
                                .clipShape(Circle())
                                .shadow(radius: 4)
                        }
                        .padding(.trailing, 20)
                    }
                    .padding(.bottom, 30)
                }
            }
            .sheet(isPresented: $showCart) {
                VStack(spacing: 20) {
                    Text("Your Order")
                        .font(.title)
                        .bold()
                    
                    Text("Your cart is empty!")
                        .foregroundColor(.gray)
                    
                    Button("Close") {
                        showCart = false
                    }
                    .padding()
                }
                .padding()
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            
            // SELL TAB
            NavigationStack {
                SellScreen()
            }.tabItem {
                Image(systemName: "plus")
                Text("Sell")
            }
            
            // PROFILE TAB
            NavigationStack {
                ProfileScreen()
            }.tabItem {
                Image(systemName: "person.fill")
                Text("Profile")
            }
        }
    }
}


// MARK: - Card View
struct CardView: View {
    let title: String
    let backgroundColor: AnyGradient
    
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 30))
        }
        .frame(width: 185, height: 100)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

#Preview {
    Dashboard()
}
