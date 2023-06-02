//
//  ContentView.swift
//  SFGPT
//
//  Created by OSlash on 23/05/23.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @State var chatMessages: [ChatMessage] = []
    @State var messageText: String = ""
    
    let openAIService = OpenAIServiceViewModel()
    
    @State var cancellables = Set<AnyCancellable>()
    
    var body: some View {
        NavigationView {
            VStack{
                ScrollView {
                    LazyVStack {
                        ForEach(chatMessages, id: \.id) { message in
                            ChatMessageView(message: message)
                        }
                    }
                    .padding()
                }
                HStack{
                    TextField("Enter a message", text: $messageText)
                        .padding()
                        .background(.gray.opacity(0.1))
                        .cornerRadius(12)
                    Button{
                        sendMessage()
                        clearTextField()
                    } label: {
                        Text("Send")
                            .foregroundColor(.white)
                            .padding()
                            .background(.black)
                            .cornerRadius(12)
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationBarItems(leading: CustomHeaderView())
    }
    
    func clearTextField() {
        self.messageText = ""
    }
    
    func sendMessage() {
        let myMessage = ChatMessage(id: UUID().uuidString, content: messageText, dateCreated: Date(), sender: .me)
        chatMessages.append(myMessage)
        openAIService.sendMessage(message: messageText).sink { completion in
            
        } receiveValue: { respone in
            guard let textResponse = respone.choices.first?.text.trimmingCharacters(in: .whitespacesAndNewlines.union(.init(charactersIn: "\""))) else {return}
            let gptMessage = ChatMessage(id: respone.id, content: textResponse, dateCreated: Date(), sender: .gpt)
            chatMessages.append(gptMessage)
        }
        .store(in: &cancellables)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}


enum MessageSender {
    case me
    case gpt
}
