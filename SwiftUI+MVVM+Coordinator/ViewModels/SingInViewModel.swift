//
//  SingInViewModel.swift
//  SwiftUI+MVVM+Coordinator
//
//  Created by Татьяна Аникина on 22.03.2023.
//

import Foundation

protocol SingInViewModelProtocol: ObservableObject {
    func firstAction()
    func toPageOneAction()
}

final class SingInViewModel: SingInViewModelProtocol, SingInFlowStateProtocol {

    // MARK: - Flow State
    @Published var activeLink: SingInLink?

    // MARK: - View Model

    init() { }

    func firstAction() {
        activeLink = .toLogin
    }
    
    func toPageOneAction() {
        activeLink = .toPageOne
    }
 }
