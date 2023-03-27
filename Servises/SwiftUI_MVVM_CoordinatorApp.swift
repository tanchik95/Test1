//
//  SwiftUI_MVVM_CoordinatorApp.swift
//  SwiftUI+MVVM+Coordinator
//
//  Created by Татьяна Аникина on 22.03.2023.
//

import SwiftUI

@main
struct SwiftUI_MVVM_CoordinatorApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            SingInView(viewModel: SingInViewModel())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
