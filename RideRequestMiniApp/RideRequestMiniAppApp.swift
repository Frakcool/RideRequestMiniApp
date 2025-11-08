//
//  RideRequestMiniAppApp.swift
//  RideRequestMiniApp
//
//  Created by Jesus Sanchez on 08/11/25.
//

import SwiftUI

@main
struct RideRequestMiniAppApp: App {
    var body: some Scene {
        WindowGroup {
            let vm = RideRequestViewModel(origin: "", destination: "", networkService: RideRequestNetworkService())
            ContentView(viewModel: vm)
        }
    }
}
