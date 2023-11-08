//
//  SideMenuViewModel.swift
//  GestionPublication
//
//  Created by Apple Esprit on 8/11/2023.
//

import Foundation
enum SideMenuViewModel : Int, CaseIterable {
    case profile
    case lists
    case bookmarks
    case logout
    
    
    var title: String {
        switch self {
        case .profile : return "profile"
        case .lists : return "profile"
        case .bookmarks : return "bookmarks"
        case .logout : return "profile"

        


        }
    }
    var imageName : String {
        switch self {
        case .profile : return "person"
        case .lists : return "list.bullet"
        case .bookmarks : return "bookmark"
        case .logout : return "arrow.left.square"


        }
    }

    
}
