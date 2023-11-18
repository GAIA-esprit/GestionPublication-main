//
//  EarthWiseFilterViewModel.swift
//  GestionPublication
//
//  Created by Apple Esprit on 8/11/2023.
//

import Foundation
enum EarthWiseFilterViewModel : Int, CaseIterable {
    case post
    case replies
    case likes
    
    
    var title: String {
        switch self {
        case .post : return " post "
        case .replies : return " Replies"
        case .likes : return " Likes"
        }
    }
    
}
