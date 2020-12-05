//
//  JourneyPageEvent.swift
//
//
//  Created by hengyu on 2020/12/5.
//  Copyright © 2020 hengyu. All rights reserved.
//

import Foundation

public protocol JourneyPageEvent: JourneyEvent {
    associatedtype Page: JourneyPage

    var page: Page { get }
}

extension JourneyPageEvent {

    public var attributes: [String: Encodable] {
        [
            "action": action.description,
            "page": page.description,
            "context": context.description
        ]
    }
}
