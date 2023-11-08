//
//  BaseView.swift
//  GestionPublication
//
//  Created by MacOS on 5/11/2023.
//
import SwiftUI

/*@ViewBuilder
func TabButton(image:String) -> some  View {
    Button{
        withAnimation{currentTab = image}
    } label: {
        Image(image)
            .resizable()
            .renderingMode(.template)
            .aspectRatio(contentMode: .fit)
            .frame(width: 23 , height:22)
            .foregroundColor(currentTab == image ?.primary:.gray)
            .frame(maxWidth: .infinity)
    }
}*/
struct TabButton: View {
    var image: String
    @Binding var currentTab: String

    var body: some View {
        Button(action: {
            withAnimation {
                currentTab = image
            }
        }) {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 23, height: 22)
                .foregroundColor(currentTab == image ? .primary : .gray)
                .frame(maxWidth: .infinity)
        }
    }
}


struct BaseView: View {
    @State var showMenu:Bool=false
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @State var currentTab = "Home"
    @State var offset : CGFloat = 0
    @State var lastStoredOffset : CGFloat = 0
    
    @GestureState var gestureOffset: CGFloat = 0
    
    var body: some View {
        let sideBarwidth = getRect().width - 90
        NavigationView{
            
            HStack(spacing:0 ){
                
                SideMenu(showMenu: $showMenu)
                
                VStack(spacing : 0){
                    TabView(selection: $currentTab){
                        Home(showMenu: $showMenu)
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("Home")
                        
                        Text("Search")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("Search")
                        
                        Text("Notifications")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("Notifications")
                        
                        Text("messages")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("messages")
                        
                        
                    }
                    VStack(spacing:0){
                        
                        
                        Divider()
                        
                    
                        HStack(spacing:0){
                            
                            TabButton(image:"Home", currentTab: $currentTab)
                            TabButton(image:"Search", currentTab: $currentTab)
                            TabButton(image:"Notifications", currentTab: $currentTab)
                            TabButton(image:"messages", currentTab: $currentTab)
                        }
                        .padding([.top],15)
                    }
                }
                .frame(width: getRect().width)
                .overlay (
                    Rectangle()
                        .fill(
                            Color.primary
                                .opacity(Double(( offset / sideBarwidth) / 5))
                            
                        )
                        .ignoresSafeArea(.container,
                                         edges: .vertical)
                        .onTapGesture {
                            withAnimation {
                                showMenu.toggle()
                            }
                        }
                )
            }
            .frame(width: getRect().width + sideBarwidth)
            .offset(x: -sideBarwidth / 2)
            .offset(x: offset > 0 ? offset : 0 )
            .gesture(
                DragGesture()
                    .updating($gestureOffset, body: { value, out,
                        _ in
                        out = value.translation.width
                        
                    })
                    .onEnded(onEnd(value: ))
                
            )
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
        }
        .animation( .easeOut, value: offset==0)
        .onChange(of: showMenu ){
            newValue in
            if showMenu && offset == 0 {
                offset = sideBarwidth
                lastStoredOffset = offset
            }
            
            if !showMenu && offset == sideBarwidth{
                offset = 0
                lastStoredOffset = 0
            }
        }
        .onChange(of: gestureOffset) {
            newValue in
            onChange()
        }
        
    }
    
    func onChange () {
        let sideBarwidth = getRect().width - 90
        
        offset = ( gestureOffset != 0  ) ? (gestureOffset + lastStoredOffset < sideBarwidth ? gestureOffset + lastStoredOffset : offset): offset
        
    }
    func onEnd(value: DragGesture.Value){
        let sideBarwidth = getRect().width - 90
        
        let translation = value.translation.width
        
        withAnimation{
            
            if translation > 0 {
                
                if translation > (sideBarwidth / 2 ){
                    offset = sideBarwidth
                    showMenu = false
                    
                }
                else
                {
                    if offset == sideBarwidth {
                        return
                    }
                    offset=0
                    showMenu = false
                    
                }
            }
            else{
                if -translation > (sideBarwidth / 2){
                    offset=0
                    showMenu = false
                }
                else{
                    if offset == 0 || !showMenu {
                        return
                    }
                    
                    
                    offset = sideBarwidth
                    showMenu = true
                    
                    
                }
                
            }
            
            lastStoredOffset = offset
            
        }

   
        
        
        struct BaseView_Previews: PreviewProvider {
            static var previews: some View {
                BaseView()
            }
        }
    }
}
