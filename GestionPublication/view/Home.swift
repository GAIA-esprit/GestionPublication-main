//
//  Home.swift
//  GestionPublication
//
//  Created by MacOS on 5/11/2023.
//

import SwiftUI

struct Home: View {
    @Binding var showMenu: Bool
    var body: some View {
        
        VStack{
            VStack(spacing:0){
                HStack{
                    Button {
                        withAnimation{showMenu.toggle()}
                        
                    }label: {
                        Image("pdp")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 35, height: 35)
                            .clipShape(Circle())
                    }
                    
                    Spacer()
                    
                    NavigationLink{
                        
                    }label: {
                        Image("messages")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 22,height: 22)
                            .foregroundColor(.primary)
                    }
                }
                .padding(.horizontal)
                .padding(.vertical,10)
                Divider()
                
            }
            .overlay(
               Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70, height: 70)
               
             
            )
            
             Spacer()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
