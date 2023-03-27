//
//  PageOneLatestViewModelProtocol.swift
//  SwiftUI+MVVM+Coordinator
//
//  Created by Татьяна Аникина on 26.03.2023.
//

import Foundation

protocol PageOneLatestViewModelProtocol {
    var category: String { get }
    var name: String { get }
    var price: Int { get }
    var imageUrl: String { get }
    init(new: Latest)
}
