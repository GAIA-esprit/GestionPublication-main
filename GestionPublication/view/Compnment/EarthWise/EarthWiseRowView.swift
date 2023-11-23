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
    @State var id : String
    @State var liked : Int
    @State var disliked : Int
    @State private var commentText: String = ""
    @ObservedObject var postviewmodel : PostViewModel = PostViewModel()
    
    
    
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
                    liked = liked + 1
                    postviewmodel.likedPost(id)
                }label: {
                    Image(systemName: "heart")
                               .font(.system(size: 30))
                               .foregroundColor(.green)
                    Text("\(liked)")
                    
                }
                
                Spacer()
                
                Button{
                    disliked = disliked + 1
                    postviewmodel.dislikedPost(id)

                }label: {
                    Image(systemName: "hand.thumbsdown.fill")
                               .font(.system(size: 30))
                               .foregroundColor(.green)
                    Text("\(disliked)")

                }
                Spacer()
                
                NavigationLink(destination: CommentView(postId: id)) {
                                 Image(systemName: "text.bubble")
                                     .font(.system(size: 30))
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
        EarthWiseRowView(author: "yesser" , iduser: "@yesser", content: "hjsfdgfqhkjsdhkqrsk", id: "123123",liked: 1,
        disliked: 0)
    }
}

