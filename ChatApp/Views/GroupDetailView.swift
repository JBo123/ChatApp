//
//  GroupDetailView.swift
//  ChatApp
//
//  Created by Jakub Klucký on 18.07.2023.
//

import SwiftUI

struct GroupDetailView: View {
    
    let group: Group
    @EnvironmentObject private var model: Model
    @State private var chatText: String = ""
    
    var body: some View {
        VStack{
            Spacer()
            TextField("Type here...", text: $chatText)
            Button("Send") {
                model.SaveChatMessageToGroup(text: chatText, group: group) { error in
                    
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
