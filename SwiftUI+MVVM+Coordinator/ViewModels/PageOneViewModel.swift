//
//  PageOneViewModel.swift
//  SwiftUI+MVVM+Coordinator
//
//  Created by Татьяна Аникина on 26.03.2023.
//

import Foundation

final class PageOneViewModel: PageOneViewModelProtocol {
    func fetch() {
        NetworkManager.shared.fetchLatest()
        NetworkManager.shared.fetchFlash()
    }
}
 
