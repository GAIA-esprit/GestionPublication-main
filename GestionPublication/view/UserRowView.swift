//
//  UserRowView.swift
//  GestionPublication
//
//  Created by Apple Esprit on 8/11/2023.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack {
            Circle()
                .frame(width:48,height: 48)
            VStack(alignment: .leading , spacing: 4){
                Text("yesser")
                    .font(.subheadline)
                    .foregroundColor(.black)
                
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView()
    }
}
