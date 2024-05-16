//
//  SwiftfulUIBootcamp.swift
//  SwiftfulThinkingSPMsAndSDKs
//
//  Created by Artur Remizov on 16.05.24.
//

import SwiftUI
import SwiftfulUI

struct SomeItem: Identifiable {
    let id: String = UUID().uuidString
    let color: Color = .red
}

struct SwiftfulUIBootcamp: View {
    @State private var isActive: Bool = true
    @State private var items: [SomeItem] = [SomeItem(), SomeItem(), SomeItem(), SomeItem(), SomeItem()]
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack {
                    Rectangle()
                        .fill(Color.green)
                        .overlay(
                            ZStack {
                                if #available(iOS 15.0, *) {
                                    AsyncImage(url: URL(string: "https://picsum.photos/800/800"))
                                }
                            }
    //                        Image(systemName: "heart.fill")
    //                            .resizable()
    //                            .scaledToFill()
    //                            .padding(100)
                        )
                        .asStretchyHeader(startingHeight: 250)
                }
            }
        }
//        CountdownViewBuilder(
//            endTime: Date().addingTimeInterval(60 * 60 * 24),
//             displayOption: .timeAs_00_00_00,
//             content: { string in
//                  Text(string)
//             },
//             onTimerEnded: {
//             
//             }
//        )
//        AsyncButton {
//             try? await Task.sleep(nanoseconds: 2_000_000_000)
//        } label: { isPerformingAction in
//             ZStack {
//                  if isPerformingAction {
//                        ProgressView()
//                  }
//                    
//                  Text("Hello, world!")
//                       .opacity(isPerformingAction ? 0 : 1)
//             }
//        }
        .onNotificationRecieved(name: UIApplication.willEnterForegroundNotification) { notification in
            
        }
        .onFirstAppear {
            
        }
        .onFirstDisappear {
            
        }
//        NonLazyVGrid(columns: 3, alignment: .leading, spacing: 16, items: items) { item in
//            if let item {
//                item.color
//                    .frame(height: 50)
//                    .frame(width: item.id == items.first?.id ? 50 : nil)
//            }
//        }
//        CustomProgressBar(
//             selection: 50,
//             range: 0...100,
//             backgroundColor: .gray.opacity(0.5),
//             foregroundColor: .blue,
//             cornerRadius: 10,
//             height: 8
//        )
//        Image(systemName: "heart.fill")
//            .redacted(if: isActive, style: .opacity)
////            .redacted(reason: .placeholder)
//            .padding(40)
//        Text("Hello, World!")
//            .padding()
//            .withBackgroundAndBorder(
//                backgroundColor: .white,
//                borderColor: .red,
//                borderWidth: 2,
//                cornerRadius: 32
//            )
////            .asButton(.opacity) {
////                
////            }
//            .withDragGesture(
//                [.horizontal, .vertical],
//                minimumDistance: 0,
//                resets: true,
////                animation: <#T##Animation#>,
////                rotationMultiplier: 1.1,
//                scaleMultiplier: 1.1,
//                onChanged: { dragOffset in
//                    
//                },
//                onEnded: { dragOffset in
//                    
//                })
//            .readingFrame { frame in
//                
//            }
    }
}

#Preview {
    SwiftfulUIBootcamp()
}
