//
//  MessageViewModel .swift
//  GestionPublication
//
//  Created by Yesser Zaghdoudi on 12/11/2023.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}
