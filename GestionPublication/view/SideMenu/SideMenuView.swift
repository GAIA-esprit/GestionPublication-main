//
//  SideMenuView.swift
//  GestionPublication
//
//  Created by Apple Esprit on 8/11/2023.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        VStack ( alignment: .leading ){
            VStack(alignment: .leading){
                Circle()
                    .frame(width: 48,height: 48)
                
                VStack{
                    
                    Text(" yesser zagh" )
                        .font(.headline)
                    
                    Text("@yesserzagh")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                }
                HStack(spacing: 24){
                    HStack(spacing: 4){
                        Text("807")
                            .font(.subheadline)
                            .bold()
                        Text("following")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                    }
                    HStack(spacing: 4){
                        Text("6,9M")
                            .font(.subheadline)
                            .bold()
                        Text("Followers")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical)
                }
                .padding(.leading)
                ForEach(SideMenuViewModel.allCases,id: \.rawValue){ viewModel in
                    if viewModel == .profile {
                        NavigationLink{
                            ProfileView()
                        }label : {
                            SideMenuOptionRowView(viewModel: viewModel)
                            
                        }
                        
                            } else if viewModel == .logout {
                                Button {
                                    print("Handle logout here .. ")
                                } label : {
                                    SideMenuOptionRowView(viewModel: viewModel)
                                    
                                }
                                
                            }else {
                                SideMenuOptionRowView(viewModel: viewModel)
                            }
                        }
                        
                        Spacer()
                        
                    }
                }
            }
            
            struct SideMenuView_Previews: PreviewProvider {
                static var previews: some View {
                    SideMenuView()
                }
            }
        }
