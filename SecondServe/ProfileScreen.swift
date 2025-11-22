//
//  ProfileScreen.swift
//  SecondServe
//
//  Created by Marc Rodenas Guasch on 21/11/25.
//

import SwiftUI

struct ProfileScreen: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    // basically creates mini functions that serve as displays.
                    // it calls those and opens up their files. (ask me if u dont understand i explained this badly)
                    NavigationLink(destination: AccountSettingsView()) {
                        Label("Account Settings", systemImage: "gearshape")
                    }
                    NavigationLink(destination: NotificationsView()) {
                        Label("Notifications", systemImage: "bell")
                    }
                    NavigationLink(destination: OrderHistoryView()) {
                        Label("Order History", systemImage: "clock")
                    }
                    NavigationLink(destination: RewardsView()) {
                        Label("Rewards", systemImage: "gift")
                    }
                    NavigationLink(destination: PointsView()) {
                        Label("Points", systemImage: "star")
                    }
                }
            }.padding([.top, .trailing])
            .navigationTitle("Profile")
            .listStyle(.insetGrouped)
        }
    }
}

struct AccountSettingsView: View {
    @State private var email: String = "user@example.com"
    @State private var password: String = ""
    
    var body: some View {
        Form {
            Section(header: Text("Login Info")) {
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                
                SecureField("Password", text: $password)
                
                Button("Forgot my password") {
                    // handle forgot password logic here
                    print("Forgot password pressed")
                }
                .foregroundColor(.blue)
            }
        }
        .navigationTitle("Account Settings")
    }
}


struct NotificationsView: View {
    @State private var ordersEnabled: Bool = true
    @State private var promotionsEnabled: Bool = false
    @State private var appUpdatesEnabled: Bool = true
    
    var body: some View {
        Form {
            Section(header: Text("Notifications Preferences")) {
                Toggle("Order Updates", isOn: $ordersEnabled)
                Toggle("Promotions", isOn: $promotionsEnabled)
                Toggle("App Updates", isOn: $appUpdatesEnabled)
            }
            
            Section(header: Text("Info")) {
                Text("You can customize which notifications you want to receive.")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .navigationTitle("Notifications")
    }
}

struct RewardsView: View {
    var body: some View {
        Text("Rewards")
            .font(.title)
            .padding()
    }
}

struct PointsView: View {
    var body: some View {
        Text("Points")
            .font(.title)
            .padding()
    }
}

//would be replaced with SSQL alchmery query
struct Order: Identifiable {
    let id = UUID()
    let itemName: String
    let quantity: Int
    let date: Date
    let status: String // e.g., "Shipped", "Processing"
}

// temporary sample orders to get a feel of how it would work
let sampleOrders = [
    Order(itemName: "Banana", quantity: 3, date: Date(), status: "Delivered"),
    Order(itemName: "Orange Juice", quantity: 1, date: Date().addingTimeInterval(-86400), status: "Processing"),
    Order(itemName: "Yogurt", quantity: 2, date: Date().addingTimeInterval(-172800), status: "Shipped")
]

struct OrderHistoryView: View {
    @State private var orders: [Order] = sampleOrders
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(orders) { order in
                    VStack(alignment: .leading, spacing: 6) {
                        HStack {
                            Text(order.itemName)
                                .font(.headline)
                            Spacer()
                            Text(order.status)
                                .font(.subheadline)
                                .foregroundColor(order.status == "Delivered" ? .green : .orange)
                        }
                        
                        HStack {
                            Text("Quantity: \(order.quantity)")
                                .font(.subheadline)
                            Spacer()
                            Text(order.date, style: .date)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.vertical, 6)
                }
            }
            .navigationTitle("Order History")
        }
    }

}

#Preview {
    ProfileScreen()
}
