//
//  BaseJourneySession.swift
//
//
//  Created by hengyu on 2020/12/5.
//  Copyright © 2020 hengyu. All rights reserved.
//

import Foundation
import JourneyInterface

public struct BaseJourneySession: JourneySession {
    public let uuid: UUID

    public static let current: BaseJourneySession = .init()

    private init() {
        uuid = UUID()
    }
}
