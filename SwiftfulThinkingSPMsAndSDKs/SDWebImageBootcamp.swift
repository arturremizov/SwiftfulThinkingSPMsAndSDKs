//
//  SDWebImageBootcamp.swift
//  SwiftfulThinkingSPMsAndSDKs
//
//  Created by Artur Remizov on 11.05.24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoader: View {
    let url: String
    var contentMode: ContentMode = .fill
    var body: some View {
        Rectangle()
            .opacity(0)
            .overlay {
                SDWebImageLoader(url: url, contentMode: contentMode)
                    .allowsHitTesting(false)
            }
            .clipped()
    }
}

fileprivate struct SDWebImageLoader: View {
    let url: String
    var contentMode: ContentMode = .fill
    var body: some View {
        WebImage(url: URL(string: url)) { image in
            image.resizable()
        } placeholder: {
            Color.gray.opacity(0.3)
        }
        .onSuccess(perform: { image, data, cacheType in
            //
        })
        .onFailure(perform: { error in
            //
        })
        .indicator(.activity)
        .aspectRatio(contentMode: contentMode)
    }
}

final class ImagePrefetcher {
    private let prefetcher: SDWebImagePrefetcher
    init(prefetcher: SDWebImagePrefetcher = .init()) {
        self.prefetcher = prefetcher
    }
    
    func startPrefetching(urls: [URL]) {
        prefetcher.prefetchURLs(urls)
    }
    
    func stopPrefetching() {
        prefetcher.cancelPrefetching()
    }
}

struct SDWebImageBootcamp: View {
    var body: some View {
        ImageLoader(
            url: "https://picsum.photos/id/237/200/300", 
            contentMode: .fill
        )
        .frame(width: 200, height: 200)
        .onAppear {
//            prefetcher.startPrefetching(urls: )
        }
    }
}

#Preview {
    SDWebImageBootcamp()
}
