//
//  MessageView.swift
//  SFGPT
//
//  Created by OSlash on 23/05/23.
//

import SwiftUI

struct MessageView: View {
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

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
