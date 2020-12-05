//
//  JourneyPageImpressionEvent.swift
//
//
//  Created by hengyu on 2020/12/5.
//  Copyright © 2020 hengyu. All rights reserved.
//

import Foundation
import JourneyInterface

public struct JourneyPageImpressionEvent: JourneyPageEvent {
    public let name: String
    public let page: BaseJourneyPage
    public let action: BaseJourneyAction
    public let context: BaseJourneyContext
    public let version: JourneyVersion

    public init(page: BaseJourneyPage, version: JourneyVersion = .version1) {
        self.name = "\(page.description.capitalized)PageImpressionEvent"
        self.page = page
        self.action = .impression
        self.context = .init()
        self.version = version
    }

    public var attributes: [String: Encodable] {
        [
            "action": action.description,
            "page": page.description,
            "context": context.description
        ]
    }
}
