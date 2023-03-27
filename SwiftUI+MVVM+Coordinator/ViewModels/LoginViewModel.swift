//
//  LoginViewModel.swift
//  SwiftUI+MVVM+Coordinator
//
//  Created by Татьяна Аникина on 26.03.2023.
//

import Foundation

protocol LoginViewModelProtocol: ObservableObject {
    func toPageOneAction()
}

final class LoginViewModel: LoginViewModelProtocol, LoginFlowStateProtocol {    

    // MARK: - Flow State
    @Published var activeLink: LoginLink?

    // MARK: - View Model

    init() { }
    
    func toPageOneAction() {
        activeLink = .toPageOne
    }
 }
