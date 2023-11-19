//
//  PostModel.swift
//  GestionPublication
//
//  Created by Mac2021 on 19/11/2023.
//
import Foundation

struct Post: Codable, Hashable {
    var title : String // Add a unique identifier
    var content: String
    var author: String

}


//struct fetchGuideReviews : Codable {
//    let statusCode : Int
//    let message : String
//    let guide : Guide
//}


struct fetchPostResponse : Decodable {
    let Posts : [Post]
    let message : String
    let statusCode : Int
}
