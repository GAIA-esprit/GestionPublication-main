//
//  PostService.swift
//  GestionPublication
//
//  Created by Mac2021 on 19/11/2023.
//

import Foundation
import Alamofire
import SwiftUI

struct Postservice {
    
    func fetchPost(completion: @escaping(Result<fetchPostResponse?, Error>) -> Void) {
        AF.request("\(Network.fetchPostUrl)",
                   method: .get,
                   encoding: JSONEncoding.default)
        .validate(contentType: ["application/json"])
        .responseData { res in
            switch res.result {
                
            case .success:
                let responseData = Data(res.data!)
                print(responseData)
                do {
                    let parsedData = try JSONDecoder().decode(fetchPostResponse.self, from: responseData)
                    completion(.success(parsedData))
                    print(parsedData.message)
                } catch {
                    print(error)
                    completion(.failure(error))
                }
                
            case let .failure(err):
                debugPrint(err)
                completion(.failure(err))
            }
        }
    }
    
}
