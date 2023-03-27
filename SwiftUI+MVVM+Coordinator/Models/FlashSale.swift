//
//  FlashSale.swift
//  SwiftUI+MVVM+Coordinator
//
//  Created by Татьяна Аникина on 22.03.2023.
//

import Foundation

struct FlashSaleResult: Decodable {
    let flashSale: [FlashSale]
}

struct FlashSale: Identifiable {
    var id: String { name }
    let category: String
    let name: String
    let price: Double
    let discount: Int
    let imageUrl: String
}

extension FlashSaleResult {
    enum CodingKeys: String, CodingKey {
        case flashSale = "flash_sale"
    }
}
    
extension FlashSale: Decodable {
        enum CodingKeys: String, CodingKey {
            case category = "category"
            case name = "name"
            case price = "price"
            case discount = "discount"
            case imageUrl = "image_url"
        }
    }
