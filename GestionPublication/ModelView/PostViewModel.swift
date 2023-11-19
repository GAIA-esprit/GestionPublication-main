//
//  PostViewModel.swift
//  GestionPublication
//
//  Created by Mac2021 on 19/11/2023.
//

import Foundation
import SwiftUI

class PostViewModel: ObservableObject {
    
    @Published var Posts: [Post] = []
    
    @Published var isLoading = true
    
    @Published var message: String = ""

    
    
    func fetchPosts() {
       Postservice().fetchPost(){ result in
            switch result {
                
            case.success(let data):
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                    if data?.statusCode == 200 {
                        self.isLoading = false
                        self.Posts = data?.Posts ?? []
                    }
                    self.message = data?.message ?? ""
                }
                
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
