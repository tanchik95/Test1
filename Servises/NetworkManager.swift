//
//  NetworkManager.swift
//  SwiftUI+MVVM+Coordinator
//
//  Created by Татьяна Аникина on 22.03.2023.
//

import Foundation

class NetworkManager: ObservableObject {
    static let shared = NetworkManager()
    
    @Published var latestManager = [Latest]()
    @Published var flash = [FlashSale]()
    
    public let latestURL = URL(string: "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7")!
    public let flashURL = URL(string: "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac")!
    
    func fetchFlash() {
        URLSession.shared.dataTask(with: flashURL) { data, response, error in
            if let data = data {
                if let decoded = try? JSONDecoder().decode(FlashSaleResult.self, from: data) {
                    DispatchQueue.main.async {
                        self.flash = decoded.flashSale
                        print(decoded.flashSale)
                    }
                }
            }
        }.resume()
    }
    
    func fetchLatest() {
        URLSession.shared.dataTask(with: latestURL) { data, response, error in
            if let data = data {
                    if let decoded = try? JSONDecoder().decode(Result.self, from: data) {
                        DispatchQueue.main.async {
                            self.latestManager = decoded.latest
                        }
                    }
            }
        }.resume()
    }
}
