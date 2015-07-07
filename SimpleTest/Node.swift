//
//  Node.swift
//  SwiftSDK
//
//  Created by Vishnu Matta on 7/6/15.
//  Copyright (c) 2015 vluxe. All rights reserved.
//

import Foundation

// Defines a protocol for a node provider
protocol NodeProvider {
    func getNode(path: String) -> Node
}

class SimpleNodeProvider: NodeProvider {
    // Node Storage. Path mapped to Node
    var nodes: [String: Node]()
    
    // Gets a Node that is stored in this node provider.
    // If there is a node stored in nodes, return that.
    // Otherwise if there is not one stored, return nil
    // TODO: Return a new node if it doesn't exist.
    func getNode(path: String) -> Node {
        if nodes[path] != nil {
            return nodes[path]
        } else {
            return nil
        }
    }
}

class Node {
    var path: String
    var provider: NodeProvider
    
    /// Node must have provider in order to add and remove children.
    init(path: String, provider: NodeProvider) {
        self.path = path
        self.provider = provider
    }
    
    var parent: Node {
        get {
            return provider.getNode(Path(path).parent.path)
        }
    }
}