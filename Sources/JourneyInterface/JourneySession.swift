//
//  JourneySession.swift
//
//
//  Created by hengyu on 2020/10/2.
//  Copyright © 2020 hengyu. All rights reserved.
//

import Foundation

public protocol JourneySession: Codable, CustomStringConvertible {

    var uuid: UUID { get }
}

extension JourneySession {

    public var uuidString: String {
        uuid.uuidString
    }

    public var description: String {
        uuidString
    }
}
