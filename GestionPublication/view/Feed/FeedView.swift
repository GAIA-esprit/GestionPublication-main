//
//  FeedView.swift
//  GestionPublication
//
//  Created by MacOS on 5/11/2023.
//

import SwiftUI

struct FeedView: View {

    @State private var showNewTweetview = false
    @ObservedObject var postViewModel = PostViewModel()
    var body: some View {
        ZStack( alignment: .bottomTrailing){
        ScrollView {
            LazyVStack{
                ForEach(postViewModel.posts) { post in
                    EarthWiseRowView(author: post.author , iduser: post.iduser, content: post.content)
                }
                        .padding()
                    
                    }
                }
        .onAppear{
            postViewModel.fetchPosts()
        }
            
            
            
            Button{
                showNewTweetview.toggle()
                
            } label: {
                
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 28 , height: 28)
                    .padding()
                
            }
            
            .background(Color(.systemGreen))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $showNewTweetview ){
                NewTweetView()
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}

