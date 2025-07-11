//
//  MainView.swift
//  Elements
//
//  Created by kavya khandelwal  on 24/12/24.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab = 0
    var body: some View {
        TabView(selection: $selectedTab){
            HomeView()
                .tabItem{
                    Label("House", systemImage: "house")
                }.tag(0)
            
            CombineView()
                .tabItem{
                    Label("Combine", systemImage: "atom")
                }.tag(1)
            
            SearchView()
                .tabItem{
                    Label("Finder", systemImage: "magnifyingglass")
                }.tag(2)
        }
    }
}

#Preview {
    MainView()
}
