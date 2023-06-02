//
//  ChatMessageView.swift
//  SFGPT
//
//  Created by OSlash on 23/05/23.
//

import SwiftUI

struct ChatMessageView: View {
    let message: ChatMessage
    var body: some View {
        HStack {
            if message.sender == .me { Spacer() }
            Text(message.content)
                .foregroundColor(message.sender == .me ? .white : .black)
                .padding()
                .background(message.sender == .me ? .blue : .gray.opacity(0.1) )
                .cornerRadius(16)
            if message.sender == .gpt  { Spacer() }
        }
    }
}

struct ChatMessageView_Previews: PreviewProvider {
    static var messageFromMe = ChatMessage(id: UUID().uuidString, content: "Message from Me", dateCreated: Date(), sender: .me
    )
    static var messageFromGpt = ChatMessage(id: UUID().uuidString, content: "Message from Gpt", dateCreated: Date(), sender: .gpt
    )
    static var previews: some View {
        ChatMessageView(message: messageFromMe)
        ChatMessageView(message: messageFromGpt)
    }
}
