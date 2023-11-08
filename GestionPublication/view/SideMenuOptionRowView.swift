//
//  SideMenuOptionRowView.swift
//  GestionPublication
//
//  Created by Apple Esprit on 9/11/2023.
//

import SwiftUI

struct SideMenuOptionRowView: View {
    let viewModel : SideMenuViewModel
    var body: some View {
        
        HStack(spacing: 16){
            Image(systemName: viewModel.imageName)
                .font(.headline)
                .foregroundColor(.gray)
            Text(viewModel.title)
                .foregroundColor(.black)
                .font(.subheadline)
            
            Spacer()
        }
        .frame(height:40)
        .padding(.horizontal)
        
        
      }
    
    }

struct SideMenuOptionRowView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
