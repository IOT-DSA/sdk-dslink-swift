//
//  Path.swift
//  SwiftSDK
//
//  Created by Vishnu Matta on 7/6/15.
//  Copyright (c) 2015 vluxe. All rights reserved.
//

import Foundation

class Path {
    var path: String
    
    init(path: String) {
        self.path = path
    }
    
    var parent: Path {
        get {
            var parts: [String] = split(path) { $0 == "/" }.map(String.init)
            var length = parts.count - 1
            parts.removeAtIndex(0)
            return parts.join("/")
        }
    }
    
    func child(name: String) -> String {
        return path + "/" + name
    }
}