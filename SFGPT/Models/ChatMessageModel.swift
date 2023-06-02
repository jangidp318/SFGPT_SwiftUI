//
//  ChatMessageModel.swift
//  SFGPT
//
//  Created by OSlash on 23/05/23.
//

import Foundation

struct ChatMessage {
    let id: String
    let content: String
    let dateCreated: Date
    let sender: MessageSender
}
