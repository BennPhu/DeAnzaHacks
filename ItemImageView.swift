import SwiftUI
import UIKit

struct ItemImageView: View {
	let url: URL?
	let imageData: Data?

	init(url: URL?, imageData: Data? = nil) {
		self.url = url
		self.imageData = imageData
	}

	init(source: ItemImageSource?) {
		switch source {
		case .data(let data):
			self.init(url: nil, imageData: data)
		case .url(let url):
			self.init(url: url)
		case .none:
			self.init(url: nil, imageData: nil)
		}
	}

	var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 12, style: .continuous)
				.fill(Color(.secondarySystemBackground))

			if let data = imageData, let uiImage = UIImage(data: data) {
				Image(uiImage: uiImage)
					.resizable()
					.scaledToFill()
					.transition(.opacity)
			} else if let url {
				AsyncImage(url: url) { phase in
					switch phase {
					case .success(let image):
						image
							.resizable()
							.scaledToFill()
							.transition(.opacity)
					case .failure:
						placeholder
					case .empty:
						ProgressView()
					@unknown default:
						placeholder
					}
				}
			} else {
				placeholder
			}
		}
		.clipped()
	}

	private var placeholder: some View {
		Image(systemName: "photo")
			.font(.largeTitle)
			.foregroundColor(.secondary)
	}
}
