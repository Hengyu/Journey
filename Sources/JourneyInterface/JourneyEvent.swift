//
//  JourneyEvent.swift
// 
//
//  Created by hengyu on 2020/10/2.
//  Copyright © 2020 hengyu. All rights reserved.
//

import Foundation

public protocol AttributesExpressable {
    var attributes: [String: Encodable] { get }
}

public protocol JourneyEvent: AttributesExpressable, CustomStringConvertible {
    associatedtype Action: JourneyAction
    associatedtype Context: JourneyContext
    associatedtype Version: JourneyVersioning

    var name: String { get }
    var action: Action { get }
    var context: Context { get }
    var version: Version { get }
}

extension JourneyEvent {

    public var description: String {
        "\(name).\(version.description)"
    }

    public var attributes: [String: Encodable] {
        [
            "action": action.description,
            "context": context.description
        ]
    }
}
