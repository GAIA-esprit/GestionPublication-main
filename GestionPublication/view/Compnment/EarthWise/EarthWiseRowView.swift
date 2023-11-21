//
//  EarthWiseRowView.swift
//  GestionPublication
//
//  Created by MacOS on 5/11/2023.
//

import SwiftUI

struct EarthWiseRowView: View {
    @State var author : String
    @State var iduser : String
    @State var content : String
   
    
    
    var body: some View {
        VStack( alignment: .leading){
            HStack(alignment : .top, spacing: 12){
            Circle()
                .frame(width: 56, height: 56)
                .foregroundColor(Color(.systemGreen))
                VStack( alignment: .leading,spacing: 4){
                   
                    HStack{
                        Text(author)
                            .font(.subheadline).bold()
                        Text(iduser)
                            .foregroundColor(.gray)
                            .font(.caption)
                        Text("2W")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    
                    Text( content)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
        }
            HStack {
                Button{
                    
                }label: {
                    Image(systemName: "heart")
                               .font(.system(size: 24))
                               .foregroundColor(.green)
                    
                }
                
                Spacer()
                
                Button{
                    
                }label: {
                    Image(systemName: "arrow.2.squarepath")
                               .font(.system(size: 24))
                               .foregroundColor(.green)
                }
                Spacer()
                
                Button{
                    
                }label: {
                    Image(systemName: "text.bubble")
                               .font(.system(size: 24))
                               .foregroundColor(.green)
                }
                Spacer()
                
                Button {
                    
                }label: {
                    Image(systemName: "bookmark")
                                .font(.system(size: 24))
                                .foregroundColor(.green)
                }
            }
            .padding()
            .foregroundColor(.gray)
           
            
            Divider()
        }
        
    }
}

struct EarthWiseRowView_Previews: PreviewProvider {
    static var previews: some View {
        EarthWiseRowView(author: "yesser" , iduser: "@yesser", content: "hjsfdgfqhkjsdhkqrsk")
    }
}

