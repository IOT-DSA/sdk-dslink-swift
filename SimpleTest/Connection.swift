//
//  Connection.swift
//  SwiftSDK
//
//  Created by Vishnu Matta on 7/6/15.
//  Copyright (c) 2015 vluxe. All rights reserved.
//

import Foundation
import Starscream
import SwiftyJSON

var socket = WebSocket(url: NSURL(scheme: "ws", host: host, path: "/")!, protocols: [])

protocol Connection {
    func onMessage(handler: (json: JSON) -> Void)
    func connect()
    func disconnect()
}

struct WebSocketConnection: Connection, WebSocketDelegate {
    var socket: WebSocket
    var socketUrl: String
    var handler: (json: JSON) -> Void
    
    init(url: String) {
        socketUrl = url
    }
    
    func onMessage(handler: (json: JSON) -> Void) {
        self.handler = handler
    }
    
    func connect() {
        if socket == nil {
          socket = WebSocket(url: NSURL(string: socketUrl))
        }
        socket.delegate = self
        socket.connect()
    }
    
    func disconnect() {
        socket.disconnect()
    }
    
    func websocketDidReceiveMessage(ws: WebSocket, text: String) {
        let json = JSON(text)
        handler(json: json)
    }
}
