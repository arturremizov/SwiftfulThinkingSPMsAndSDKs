//
//  SDWebImageBootcamp.swift
//  SwiftfulThinkingSPMsAndSDKs
//
//  Created by Artur Remizov on 11.05.24.
//

import SwiftUI
import SDWebImageSwiftUI

struct SDWebImageLoader: View {
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
