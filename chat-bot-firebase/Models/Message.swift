//
//  Message.swift
//  chat-bot-firebase
//
//  Created by Luis Camargo on 28/12/22.
//

import Foundation

struct Message: Identifiable, Codable{
    var id: String;
    var text: String;
    var received: Bool
    var timestamp: Date
}
