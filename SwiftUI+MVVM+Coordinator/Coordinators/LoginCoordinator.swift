//
//  LoginCoordinator.swift
//  SwiftUI+MVVM+Coordinator
//
//  Created by Татьяна Аникина on 26.03.2023.
//

import SwiftUI

protocol LoginFlowStateProtocol: ObservableObject {
    var activeLink: LoginLink? { get set }
}

enum LoginLink: Hashable, Identifiable {
    case toPageOne

    var navigationLink: LoginLink {
        switch self {
        case .toPageOne:
            return self
        }
    }

    var id: String {
        switch self {
        case .toPageOne:
            return "toPageOne"
        }
    }
}

struct LoginCoordinator<State: LoginFlowStateProtocol, Content: View>: View {

    @ObservedObject var state: State
    let content: () -> Content

    private var activeLink: Binding<LoginLink?> {
        $state.activeLink.map(get: { $0?.navigationLink }, set: { $0 })
    }

    var body: some View {
        NavigationView {
            ZStack {
                content()
                navigationLinks
            }
        }
        .navigationViewStyle(.stack)
        .navigationBarHidden(true)
    }

    @ViewBuilder private var navigationLinks: some View {
        NavigationLink(tag: .toPageOne, selection: activeLink, destination: secondDestination) { EmptyView() }
    }
    

   
    
    private func secondDestination() -> some View {
        return TabBarView()
    }
}
