//
//  ContentView.swift
//  GestionPublication
//
//  Created by MacOS on 4/11/2023.
//

import SwiftUI


struct ContentView: View {
    @State private var showMenu = false
    @Environment(\.managedObjectContext) private var viewContext

        @FetchRequest(
            sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
            animation: .default)
        private var items: FetchedResults<Item>
    
    var body: some View {
        ZStack(alignment: .topLeading){
            MainTabView()
            
                .navigationBarHidden(showMenu)
            if showMenu  {
                ZStack{
                    Color( .black)
                        .opacity(showMenu ? 0.25 : 0.0 )
                }
                .onTapGesture {
                    withAnimation(.easeInOut){
                        showMenu = false
                    }
                }
                .ignoresSafeArea()
            }
            SideMenuView()
                .frame(width : 300)
                .offset(x:showMenu ? 0: -300 , y : 0)
                .background(showMenu ? Color.white: Color.clear)
        }
        .navigationTitle("EarthWise")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement : .navigationBarLeading) {
                Button {
                    withAnimation(.easeInOut) {
                        showMenu.toggle()
                    }
                }label: {
                    Circle()
                        .frame(width: 32 , height : 32 )
                }
            }
        }
        .onAppear{
            showMenu = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)

        }
    }
}
