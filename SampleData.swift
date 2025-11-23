import Foundation

struct SampleData {
	private static let samplePhotoURLs: [URL] = [
			URL(string: "https://images.unsplash.com/photo-1615589484252-c70def71bb4f?q=80&w=986&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")!,
			URL(string: "https://images.unsplash.com/photo-1632552544459-c17697deddfb?q=80&w=987&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")!,
			URL(string: "https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?q=80&w=1480&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")!,
			URL(string: "https://images.unsplash.com/photo-1590080874088-eec64895b423?q=80&w=1494&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")!
		]

    static let user = User(
        id: UUID(),
        name: "Jamie Lee",
        email: "jamie@example.com",
        phone: "555-123-4567",
        radiusMiles: 15,
        points: 42,
        dietaryPreferences: ["Vegetarian", "Gluten-free"],
        privacySettings: PrivacySettings(
            maskAddress: true,
            inAppMessagingOnly: true,
            aiDataOptIn: false
        ),
        consents: Consents(
            aiDataProgram: false,
            createdAt: Date()
        )
    )

    static func items(ownerId: UUID) -> [Item] {
        [
            Item(
                id: UUID(),
                ownerId: ownerId,
                name: "Tomato Can",
                category: "Can",
                donation: false,
                sealed: true,
                expiryDate: Calendar.current.date(byAdding: .day, value: 2, to: Date()) ?? Date(),
                description: "Freshly baked sourdough, perfect for sandwiches.",
				photoData: nil,
				photoURLs: [samplePhotoURLs[0]],                
				priceUSD: 4.50,
                locationText: "San Jose, CA",
                status: .active,
                createdAt: Date()
            ),
            Item(
                id: UUID(),
                ownerId: ownerId,
                name: "Sesame Bun",
                category: "Bread",
                donation: true,
                sealed: false,
                expiryDate: Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date(),
                description: "Freshly baked bread from this week's CSA box.",
				photoData: nil,
				photoURLs: [samplePhotoURLs[1]],                
				priceUSD: nil,
                locationText: "Cupertino, CA",
                status: .active,
                createdAt: Date()
            ),
            Item(
                id: UUID(),
                ownerId: UUID(),
                name: "A Bunch of Banana",
                category: "Fruit",
                donation: false,
                sealed: true,
                expiryDate: Calendar.current.date(byAdding: .hour, value: 12, to: Date()) ?? Date(),
                description: "A bunch of banana.",
				photoData: nil,
				photoURLs: [samplePhotoURLs[2]],                
				priceUSD: 10.0,
                locationText: "Sunnyvale, CA",
                status: .pendingApproval,
                createdAt: Date()
            ),
            Item(
                id: UUID(),
                ownerId: UUID(),
                name: "Cookies",
                category: "Snacks",
                donation: true,
                sealed: false,
                expiryDate: Calendar.current.date(byAdding: .day, value: 3, to: Date()) ?? Date(),
                description: "Delicious freshly baked cookies.",
				photoData: nil,
				photoURLs: [samplePhotoURLs[3]],                
				priceUSD: nil,
                locationText: "Mountain View, CA",
                status: .active,
                createdAt: Date()
            )
        ]
    }
}
