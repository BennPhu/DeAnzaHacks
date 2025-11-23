import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var itemsVM: ItemsViewModel
    @EnvironmentObject private var cartVM: CartViewModel
    @EnvironmentObject private var tabRouter: TabRouter

    @State private var searchText = ""
    @State private var showingCart = false
    @State private var showingMenu = false

    private let columns = Array(repeating: GridItem(.flexible(), spacing: 12), count: 2)

    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Button {
                    showingMenu = true
                } label: {
                    Image(systemName: "line.3.horizontal")
                        .font(.title2)
                }
                Spacer()
                Text("Second Serve")
                    .font(.headline)
					.foregroundColor(.appCharcoal)
                Spacer()
                Spacer().frame(width: 27)
            }
            .padding(.horizontal)

            BannerView()
                .padding(.horizontal)

            ScrollView {
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(filteredItems) { item in
                        NavigationLink {
                            ItemDetailView(item: item)
                        } label: {
                            ItemCardView(item: item)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 8)

                Spacer(minLength: 12)
            }

            searchAndCartRow
                .padding(.horizontal)
                .padding(.bottom, 8)
        }
		.background(Color.appCream.ignoresSafeArea())
        .sheet(isPresented: $showingCart) {
            NavigationStack {
                CartView()
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Close") { showingCart = false }
                        }
                    }
            }
        }
        .sheet(isPresented: $showingMenu) {
            MenuView {
                showingMenu = false
            }
            .environmentObject(tabRouter)
        }
    }

    private var filteredItems: [Item] {
        guard !searchText.isEmpty else { return itemsVM.activeItems }
        return itemsVM.activeItems.filter { item in
            let term = searchText.lowercased()
            return item.name.lowercased().contains(term) ||
                item.category.lowercased().contains(term) ||
                (item.donation ? "donate" : "sell").contains(term)
        }
    }

    private var searchAndCartRow: some View {
        HStack(spacing: 12) {
            HStack {
                Image(systemName: "magnifyingglass")
					.foregroundColor(.appCharcoal)
                TextField("Search food or type", text: $searchText)
                    .textInputAutocapitalization(.never)
            }
            .padding()
			.background(Color.white.opacity(0.9))
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))

            Button {
                showingCart = true
            } label: {
                Image(systemName: "cart.fill")
                    .font(.title3)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
					.background(Color.appPrimary)
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            }
            .frame(width: 70)
        }
    }
}

private struct BannerView: View {
	private let bannerImageURLString = "https://hungerathome.org/wp-content/uploads/2024/08/hunger-at-home.png" // Replace with your banner image URL

		private var bannerImageURL: URL? {
			URL(string: bannerImageURLString)
		}

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Save food, save money.")
                    .font(.headline)
					.foregroundColor(.appCharcoal)
                Text("Discover surplus meals nearby.")
                    .font(.subheadline)
					.foregroundColor(.appCharcoal.opacity(0.8))
            }
            Spacer()
			if let bannerImageURL {
				AsyncImage(url: bannerImageURL) { phase in
					switch phase {
					case .empty:
						ProgressView()
					case .success(let image):
						image
							.resizable()
							.scaledToFit()
							.frame(width: 80, height: 80)
					case .failure:
						Image(systemName: "photo")
							.resizable()
							.scaledToFit()
							.frame(width: 60, height: 60)
							.foregroundColor(.appPrimary)
					@unknown default:
						EmptyView()
					}
				}
			} else {
				Image(systemName: "leaf.fill")
					.foregroundColor(.appPrimary)
					.font(.title2)
			}
        }
        .padding()
		.background(Color.appAccentGreen.opacity(0.4))
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}

private struct ItemCardView: View {
    let item: Item

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
			ItemImageView(source: item.allImageSources.first)
				.frame(height: 120)
				.clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            Text(item.name)
                .font(.headline)
				.foregroundColor(.appCharcoal)


            HStack {
                Text(item.donation ? "Donate" : "Sell")
                    .font(.caption)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
					.background(item.donation ? Color.appAccentGreen.opacity(0.7) : Color.appPrimary.opacity(0.1))
                    .clipShape(Capsule())
                Spacer()
                Text(expiryText)
                    .font(.caption)
					.foregroundColor(.appCharcoal)
            }

            HStack {
                Text(priceText)
                    .font(.subheadline)
                    .bold()
                Spacer()
                if !item.sealed {
                    Text("Unsealed")
                        .font(.caption2)
                        .padding(6)
						.background(Color.appTomato.opacity(0.15))
                        .clipShape(Capsule())
                }
                if item.status == .pendingApproval {
                    Text("Pending")
                        .font(.caption2)
                        .padding(6)
						.background(Color.appTomato.opacity(0.2))
                        .clipShape(Capsule())
                }
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
    }

    private var priceText: String {
        if item.donation { return "Free" }
        let price = item.priceUSD ?? 0
        return "$\(String(format: "%.2f", price))"
    }

    private var expiryText: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return "Exp: \(formatter.string(from: item.expiryDate))"
    }
}
