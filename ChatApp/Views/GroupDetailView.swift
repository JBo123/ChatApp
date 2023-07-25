//
//  GroupDetailView.swift
//  ChatApp
//
//  Created by Jakub Klucký on 18.07.2023.
//

import SwiftUI
import FirebaseAuth

struct GroupDetailView: View {
    
    let group: Group
    @EnvironmentObject private var model: Model
    @State private var chatText: String = ""
    
    private func sendMessage() async throws {
        
        guard let currentUser = Auth.auth().currentUser else { return }
        
        let chatMessage = ChatMessage(text: chatText, uid: currentUser.uid, displayName: currentUser.displayName ?? "Guest")
        
        try await model.SaveChatMessageToGroup(chatMessage: chatMessage, group: group)
    }
    
    var body: some View {
        VStack{
            Spacer()
            TextField("Type here...", text: $chatText)
            Button("Send") {
                Task{
                    do{
                        try await sendMessage()
                    } catch{
                        print(error.localizedDescription)
                    }
                }
                
            }
        }.padding()
    }
}

struct GroupDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GroupDetailView(group: Group(subject: "Moveis"))
            .environmentObject(Model())
    }
}
