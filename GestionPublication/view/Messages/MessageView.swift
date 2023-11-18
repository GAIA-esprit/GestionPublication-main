//
//  MessageView.swift
//  GestionPublication
//
//  Created by MacOS on 5/11/2023.
//

import SwiftUI

struct MessageView: View {
    var messageArray = [" djkfjklhdljhqgjklhlfjld"]
    
    var body: some View {
        VStack {
            VStack {
                TitleRow()
                ScrollView {
                    ForEach(messageArray, id: \.self) {text in MessageBubble(message: Message(id:"123456", text : text, received: true, timestamp: Date() ))
                    }
                }
                .padding(.top, 10)
                .background(.white)
                .cornerRadius(30, corners: [.topLeft, .topRight])
            }
            .background(Color.green.opacity(0.5))
            MessageField()
        }
    }
}

        struct MessageView_Previews: PreviewProvider {
            static var previews: some View{
                MessageView()
        }
    }

