# Image Usage Guide

## Where images live
- All local images are stored in `Assets.xcassets` inside this project. Each image set should include 1x/2x/3x PNGs or a single PDF vector.
- To add an image: in Xcode, right-click `Assets.xcassets` → **New Image Set** → drag your assets into the 1x/2x/3x slots → name the set (e.g., `PearBanner`).

## Using images in SwiftUI
- Local assets: `Image("AssetName")` or `Image("AssetName").resizable()` for layout control.
- Remote URLs: use `AsyncImage(url:)` or your own loader; keep placeholders in `Assets.xcassets`.

### Examples
```swift
// Local asset from Assets.xcassets
Image("PearBanner")
    .resizable()
    .scaledToFill()
    .frame(height: 140)
    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))

// Remote image with a local placeholder
AsyncImage(url: URL(string: "https://example.com/photo.jpg")) { phase in
    switch phase {
    case .empty:
        ProgressView()
    case .success(let image):
        image.resizable().scaledToFill()
    case .failure:
        Image("PearBanner").resizable().scaledToFit()
    @unknown default:
        EmptyView()
    }
}
.frame(height: 140)
.clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
```
