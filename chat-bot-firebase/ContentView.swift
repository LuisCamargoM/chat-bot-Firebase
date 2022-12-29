//
//  ContentView.swift
//  chat-bot-firebase
//
//  Created by Luis Camargo on 28/12/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var messagesManager = MessagesManager()
    var body: some View {
        VStack(){
            VStack() {
                Header()
                ScrollViewReader{  proxy in
                    
                    ScrollView{
                        ForEach(messagesManager.messages, id: \.id) { message in
                            MessageBubble(message: message)
                        }
                    }
                    .padding(.top,20)
                    .cornerRadius(radius: 30, corners: [.topLeft, .topRight])
                    .onChange(of: messagesManager.lastMessageId){
                        id in withAnimation{
                            proxy.scrollTo(id, anchor: .bottom)
                        }
                    }
                }
            }
            MessageField().environmentObject(messagesManager)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
