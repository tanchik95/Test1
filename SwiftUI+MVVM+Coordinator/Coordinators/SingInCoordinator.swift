//
//  SingInCoordinator.swift
//  SwiftUI+MVVM+Coordinator
//
//  Created by Татьяна Аникина on 22.03.2023.
//


import SwiftUI

protocol SingInFlowStateProtocol: ObservableObject {
    var activeLink: SingInLink? { get set }
}

enum SingInLink: Hashable, Identifiable {
    case toLogin
    case toPageOne

    var navigationLink: SingInLink {
        switch self {
        case .toLogin:
            return self
        case .toPageOne:
            return self
        }
    }

    var id: String {
        switch self {
        case .toLogin:
            return "toLogin"
        case .toPageOne:
            return "toPageOne"
        }
    }
}

struct SingInFlowCoordinator<State: SingInFlowStateProtocol, Content: View>: View {

    @ObservedObject var state: State
    let content: () -> Content

    private var activeLink: Binding<SingInLink?> {
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
        NavigationLink(tag: .toLogin, selection: activeLink, destination: firstDestination) { EmptyView()
        NavigationLink(tag: .toPageOne, selection: activeLink, destination: secondDestination) { EmptyView() }
        }
    }

    private func firstDestination() -> some View {
        return LoginView(viewModel: LoginViewModel()).environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
    
    private func secondDestination() -> some View {
        return TabBarView()
    }
}

extension Binding {
    func map<T>(get: @escaping (Value) -> T?, set: @escaping (T?) -> Value) -> Binding<T?> {
        Binding<T?>(
            get: {
                get(wrappedValue)
            },
            set: {
                wrappedValue = set($0)
            }
        )
    }
}
