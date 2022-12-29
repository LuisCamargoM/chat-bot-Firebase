//
//  Header.swift
//  chat-bot-firebase
//
//  Created by Luis Camargo on 28/12/22.
//

import SwiftUI

struct Header: View {
    var imageUrl = URL(string:"https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80");
    var name = "Christian Bezos";
    var statusConnection = "Online";
    
    var body: some View {
        HStack(spacing:20){ // Horizontal View = HStack
            AsyncImage(url:imageUrl){ image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:50, height: 50)
                    .cornerRadius(50)
            } placeholder: {
                    ProgressView()
            }
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.title).bold()
                    .foregroundColor(Color("PrimaryColor"))
                
                Text(statusConnection)
                    .font(.caption)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "phone.fill")
                .foregroundColor(.gray)
                .padding(10)
                .background(.white)
                .cornerRadius(50)
        }
        .padding(20)
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
            .background(Color("PrimaryColor"))
    }
}
