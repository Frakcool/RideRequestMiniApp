//
//  RideRequestViewModel.swift
//  RideRequestMiniApp
//
//  Created by Jesus Sanchez on 08/11/25.
//

import Foundation
import Observation

protocol NetworkServiceProtocol {
    func getBaseFare() async -> Double
}

@Observable
class RideRequestViewModel {
    var origin: String
    var destination: String
    var fare: Double?
    var isLoading: Bool = false
    
    var networkService: NetworkServiceProtocol
    
    init(origin: String, destination: String, networkService: NetworkServiceProtocol) {
        self.origin = origin
        self.destination = destination
        self.networkService = networkService
    }
    
    func calculateFare() async {
        isLoading = true
        let distance = Int.random(in: 1 ..< 100)
        let baseFare = await getBaseFare()
        
        fare = Double(distance) * baseFare
        isLoading = false
    }
    
    func getBaseFare() async -> Double {
        return await networkService.getBaseFare()
    }
    
    func isValid() -> Bool {
        !origin.isEmpty && !destination.isEmpty
    }
}

class RideRequestNetworkService: NetworkServiceProtocol {
    func getBaseFare() async -> Double {
        try? await Task.sleep(for: .seconds(0.8))
        return Double.random(in: 10 ..< 15)
    }
}
