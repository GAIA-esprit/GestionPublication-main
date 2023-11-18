//
//  NewTweetView.swift
//  GestionPublication
//
//  Created by iMac on 11/11/2023.
//

import SwiftUI

struct NewTweetView: View {
    @State private var caption = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack{
            HStack {
                Button{
                    presentationMode.wrappedValue.dismiss()
            }label: {
                Text("Cancel")
                    .foregroundColor(Color(.systemGreen))
                
            }
                Spacer()
                
                
                
                Button{
                print("Tweet")
            }label: {
                Text("Tweet")
                    .bold()
                    .padding(.horizontal)
                    .padding(.vertical,8)
                    .background(Color.green.opacity(0.5))
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                
                
            }
                
        }
           
            .padding()
            HStack(alignment: .top){
            Circle()
                .frame(width: 64 , height: 64)
            TextArea("what's happening?" , text : $caption )
                    .padding(.horizontal,5)
                    .padding(.vertical,5)
                    .background(Color.gray.opacity(0.3))
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding()
        }

    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}
