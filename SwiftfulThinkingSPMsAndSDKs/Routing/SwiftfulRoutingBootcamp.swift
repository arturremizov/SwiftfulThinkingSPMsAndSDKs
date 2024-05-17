//
//  SwiftfulRoutingBootcamp.swift
//  SwiftfulThinkingSPMsAndSDKs
//
//  Created by Artur Remizov on 17.05.24.
//

import SwiftUI
import SwiftfulRouting

struct SwiftfulRoutingBootcamp: View {
    var body: some View {
        RouterView { router in
            MyHomeView(viewModel: MyHomeViewModel(router: router))
//            Text("View1")
//                .onTapGesture {
//                    router.showScreen(.push) { router2 in
//                        Text("View2")
//                            .onTapGesture {
//                                router2.showScreen(.push) { router3 in
//                                    Text("View3")
//                                        .onTapGesture {
//                                            router3.showScreen(.push) { router4 in
//                                                Text("View4")
//                                                    .onTapGesture {
//                                                        router4.dismissScreen()
//                                                    }
//                                            }
//                                        }
//                                }
//                            }
//                    }
//                }
//            MyHomeView(router: router)
        }
    }
}

final class MyHomeViewModel: ObservableObject {
    let router: AnyRouter
    init(router: AnyRouter) {
        self.router = router
    }
    
    func goToNextScreen() {
//        router.showScreen(.push) { router in
//            MyThirdScreen(router: router)
//        }
        let route1 = PushRoute(destination: { router in
             Text("View1")
        })
        let route2 = PushRoute(destination: { router in
             Text("View2")
        })
        let route3 = PushRoute(destination: { router in
             Text("View3")
                .onTapGesture {
                    router.dismissScreenStack()
                }
        })
        router.pushScreenStack(destinations: [route1, route2, route3])
    }
}

struct MyHomeView: View {
//    @Environment(\.router) private var router
//    let router: AnyRouter
    @StateObject var viewModel: MyHomeViewModel
    
    let route: AnyRoute = AnyRoute(.push) { router in
        MyThirdScreen(router: router)
    }
    var body: some View {
        Button("CLICK ME", action: {
            viewModel.goToNextScreen()
//            router.showBasicModal {
//                Text("Hi")
//            }
//            router.showScreen(route)
//            router.showScreen(.push) { _ in
//                MyThirdScreen()
//            }
        })
        .navigationTitle("Home")
    }
}

struct MyThirdScreen: View {
//    @Environment(\.router) private var router
    let router: AnyRouter
    var body: some View {
        Button("CLICK ME", action: {
            router.dismissScreen()
        })
        .navigationTitle("Screen 3")
    }
}

#Preview {
    SwiftfulRoutingBootcamp()
}
