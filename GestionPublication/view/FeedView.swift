//
//  FeedView.swift
//  GestionPublication
//
//  Created by MacOS on 5/11/2023.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView {
            LazyVStack{
                ForEach(0...20, id: \ .self  ){
                    _ in  EarthWiseRowView()
                        .padding()
                    
                    
                }
            }
        }
        
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
