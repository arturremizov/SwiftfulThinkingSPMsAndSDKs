//
//  LottieBootcamp.swift
//  SwiftfulThinkingSPMsAndSDKs
//
//  Created by Artur Remizov on 18.05.24.
//

import SwiftUI
import Lottie

struct LottieHelperView: View {
    
    let fileName: String
    var contentMode: UIView.ContentMode = .scaleAspectFill
    var playLoopNMode: LottieLoopMode = .playOnce
    var animationDidFinish: (() -> Void)? = nil
    
    var body: some View {
        LottieView(animation: .named(fileName))
            .configure{ lottieAnimationView in
                lottieAnimationView.contentMode = contentMode
//                lottieAnimationView.shouldRasterizeWhenIdle = true
            }
            .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
            .animationDidFinish { completed in
                animationDidFinish?()
            }
    }
}

#Preview {
    LottieHelperView(fileName: "StarAnimation.json")
}
