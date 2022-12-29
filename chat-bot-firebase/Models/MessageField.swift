//
//  MessageField.swift
//  chat-bot-firebase
//
//  Created by Luis Camargo on 28/12/22.
//

import SwiftUI

struct MessageField: View {
    @EnvironmentObject var messagesManager : MessagesManager
    @State private var message = "";
    
    var body: some View {
        HStack{
            CustomTextField(placeholder:Text("Enter your message here"), text: $message)
        
            Button {
                print("Message sent!: \(message)")
                messagesManager.sendMessage(text: message)
                message = ""
            } label : {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color("PrimaryColor"))
                    .cornerRadius(50)
            }
        }
        .padding(.horizontal)
        .padding(.vertical,10)
        .cornerRadius(50)
    }
}

struct MessageField_Previews: PreviewProvider {
    static var previews: some View {
        MessageField()
            .environmentObject(MessagesManager())
    }
}


struct CustomTextField: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged:(Bool) -> () = {_ in}
    var commit: () -> () = {}
    
    var body: some View {
        ZStack(alignment: .leading){
            if text.isEmpty{
                placeholder
                    .opacity(0.9)
                    .foregroundColor(.gray)
                    .padding(.leading,20)
            }
            
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
                .foregroundColor(.black).bold()
                .padding(.leading,20)
        }
    }
}
