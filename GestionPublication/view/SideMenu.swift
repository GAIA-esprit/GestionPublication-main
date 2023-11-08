//
//  SideMenu.swift
//  GestionPublication
//
//  Created by MacOS on 4/11/2023.
//

import SwiftUI


struct SideMenu: View {
    @Binding var showMenu:Bool
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            VStack(alignment: .leading, spacing: 12) {
                
                Image("pdp")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 65 , height: 60)
                    .clipShape(Circle())
                Text("Yesser Zagh")
                    .font(.callout)
                HStack(spacing: 5){
                    Button {
                        
                    } label: {
                        Label{
                            Text("Followers")
                        } icon: {
                            Text("189")
                                .fontWeight(.bold)
                        }
                    }
                    Button {
                        
                    } label: {
                        Label{
                            Text("Following")
                        } icon: {
                            Text("1.2M")
                                .fontWeight(.bold)
                        }
                    }
                    
            
                }
                .foregroundColor(.primary)
                                
            }
            .padding(.horizontal)
            .padding(.leading)
            .padding(.bottom)
            
            ScrollView(.vertical , showsIndicators: false) {
                
                VStack(alignment: .leading , spacing: 45) {
                    
                    TabButton(title: "Profile", image: "Profile")
                    TabButton(title: "Lists", image: "Lists")
                    
                }
                .padding()
                .padding(.leading)
                .padding(.top,35)
                
                Divider()
                
                TabButton(title: "EarthWise Ads ", image: "Ads")
                
                    .padding()
                    .padding(.leading)
                Divider()
                
                VStack(alignment: .leading , spacing: 30) {
                    Button("Settings And Privacy"){
                        
                    }
                    Button("Help Center"){
                        
                    }
                }
                .padding()
                .padding(.leading)
                .padding(.bottom)
                .frame(maxWidth: .infinity,alignment: .leading)
                .foregroundColor(.primary)
            }
           
            
            VStack(spacing: 0){
                Divider()
                HStack{
                    Button{
                        
                    } label: {
                        Image("light")
                          .resizable()
                          .renderingMode(.template)
                          .aspectRatio(contentMode: .fill)
                          .frame(width:22,height: 22)
                    }
                    Spacer()
                    
                    Button{
                        
                    } label: {
                        Image("Qr")
                          .resizable()
                          .renderingMode(.template)
                          .aspectRatio(contentMode: .fill)
                          .frame(width:22,height: 22)
                    }
                }
                .padding([.horizontal,.top],15)
                .foregroundColor(.primary)
            }
        }
       
        .padding(.top)
        .frame(maxWidth: .infinity,alignment: .leading)
        
        .frame(width: getRect().width - 90)
        .frame(maxHeight : .infinity)
        .background(
            Color.primary
                .opacity(0.04)
                .ignoresSafeArea(.container,edges: .vertical)
        )
        .frame(maxWidth: .infinity,alignment:.leading)
        
    }
    @ViewBuilder
    func TabButton(title: String,image: String) -> some View{
        
        NavigationLink{
           
              Text("\(title) View")
                .navigationTitle(title)
            
        } label: {
            HStack(spacing: 14){
              Image(image)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fill)
                .frame(width:22,height: 22)
              
            Text(title)
            }
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity,alignment: .leading)
            
        }
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func getRect()-> CGRect{
        return UIScreen.main.bounds
    }
 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
