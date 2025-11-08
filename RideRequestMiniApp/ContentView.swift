//
//  ContentView.swift
//  RideRequestMiniApp
//
//  Created by Jesus Sanchez on 08/11/25.
//

import SwiftUI

struct ContentView: View {
    @State var viewModel: RideRequestViewModel
    
    var body: some View {
        VStack {
            TextField("Origin", text: $viewModel.origin)
            TextField("Destination", text: $viewModel.destination)
            if viewModel.isLoading {
                Text("Loading fare...")
            } else {
                Text("Fare for ride: $\($viewModel.fare.wrappedValue ?? 0.0)")
            }
            Button {
                Task {
                    await viewModel.calculateFare()
                }
            } label: {
                Text("Calculate Fare")
            }
            .disabled(!viewModel.isValid())
        }
        .padding()
    }
}

#Preview {
    let vm = RideRequestViewModel(origin: "", destination: "", networkService: RideRequestNetworkService())
    ContentView(viewModel: vm)
}
