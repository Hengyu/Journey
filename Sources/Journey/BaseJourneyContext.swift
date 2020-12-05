//
//  BaseJourneyContext.swift
//
//
//  Created by hengyu on 2020/10/3.
//  Copyright © 2020 hengyu. All rights reserved.
//

import Foundation
import JourneyInterface

public struct BaseJourneyContext: JourneyContext {
    private let _session: BaseJourneySession
    public let date: Date
    public var session: JourneySession {
        _session
    }

    public init(
        session: BaseJourneySession = BaseJourneySession.current,
        date: Date = .init()
    ) {
        _session = session
        self.date = date
    }

    public var description: String {
        "{\"session_id\": \(session.uuidString), \"date\": \(date)}"
    }
}
