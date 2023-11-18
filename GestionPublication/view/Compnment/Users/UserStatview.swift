//
//  UserStatview.swift
//  GestionPublication
//
//  Created by Apple Esprit on 8/11/2023.
//

import SwiftUI

struct UserStatview: View {
    var body: some View {
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
                  
              }
    }


struct UserStatview_Previews: PreviewProvider {
    static var previews: some View {
        UserStatview()
    }
}
