//
//  TapBar.swift
//  SwiftUI+MVVM+Coordinator
//
//  Created by Татьяна Аникина on 22.03.2023.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            PageOneView(viewmodel: PageOneViewModel())
                .tabItem {
                    Image("home")
                }
            FavoritesView()
                .tabItem {
                    Image("favorites")
                }
           ProductList()
                .tabItem {
                    Image("buy")
                }
           ChatView()
                .tabItem {
                    Image("chat")
                }
            ProfileView()
                .tabItem {
                    Image("prof")
                }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
