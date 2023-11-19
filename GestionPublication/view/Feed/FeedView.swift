//
//  FeedView.swift
//  GestionPublication
//
//  Created by MacOS on 5/11/2023.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewTweetview = false
    var body: some View {
        ZStack( alignment: .bottomTrailing){
        ScrollView {
            LazyVStack{
                ForEach(0...20, id: \ .self  ){
                    _ in   EarthWiseRowView(postViewModel: PostViewModel())
                        .padding()
                    
                    }
                }
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

