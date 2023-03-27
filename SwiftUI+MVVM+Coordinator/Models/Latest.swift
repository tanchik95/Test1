//
//  Latest.swift
//  SwiftUI+MVVM+Coordinator
//
//  Created by Татьяна Аникина on 22.03.2023.
//

import Foundation

struct Result: Decodable {
    var latest: [Latest]
}

struct Latest: Identifiable {
    var id: String { name }
    let category: String
    let name: String
    let price: Int
    let imageUrl: String
}

extension Latest: Decodable {
  enum CodingKeys: String, CodingKey {
    case category = "category"
    case name = "name"
    case price = "price"
    case imageUrl = "image_url"
  }
}
