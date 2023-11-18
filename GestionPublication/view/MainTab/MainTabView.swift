//
//  MainTabView.swift
//  GestionPublication
//
//  Created by MacOS on 5/11/2023.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 0
    
    var body: some View {
        TabView( selection: $selectedIndex) {
            FeedView()
                .onTapGesture {
                    self.selectedIndex=0
                }
                .tabItem {
                    Image( systemName: "house")
                }.tag(0)
            NotificationView()
                .onTapGesture {
                    self.selectedIndex=2                }
                .tabItem {
                    Image( systemName: "bell")
                }.tag(2)
            MessageView()
                .onTapGesture {
                    self.selectedIndex=3
                }
                .tabItem {
                    Image( systemName: "envelope")
                }.tag(3)
            
        }
        
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
