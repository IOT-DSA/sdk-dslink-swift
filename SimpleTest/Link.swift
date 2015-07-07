//
//  Link.swift
//  SwiftSDK
//
//  Created by Vishnu Matta on 7/6/15.
//  Copyright (c) 2015 vluxe. All rights reserved.
//

import Foundation
import SwiftyJSON

class Link {
    var connection: Connection
    
    init(connection: Connection) {
        self.connection = connection
        connection.onMessage(handler: onMessage)
    }
    
    func onMessage(json: JSON) {
        for (key: String, data: JSON) in json {
            if key == "requests" {
                handleRequests(data)
            }
        }
    }
    
    func handleRequests(json: JSON) {
        for (key: Int, data: JSON) in json {
            let rid = data["rid"].int
            handleRequest(rid, data)
        }
    }
    
    func handleRequest(rid: Int, json: JSON) {
        
    }
}
