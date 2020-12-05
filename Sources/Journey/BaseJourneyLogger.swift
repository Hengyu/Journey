//
//  BaseJourneyLogger.swift
//
//
//  Created by hengyu on 2020/12/5.
//  Copyright © 2020 hengyu. All rights reserved.
//

import Foundation
import JourneyInterface

public final class BaseJourneyLogger: JourneyLogger {

    private let networkService: NetworkLoggingService
    private let ondiskService: OndiskLoggingService

    public init(networkService: NetworkLoggingService, ondiskService: OndiskLoggingService) {
        self.networkService = networkService
        self.ondiskService = ondiskService

        networkService.initialize()
    }

    public func logEvent<T: JourneyEvent>(_ event: T) {
        networkService.logEvent(
            event.name,
            content: event.action.description,
            attributes: event.attributes
        )
        ondiskService.logEvent(
            event.name,
            content: event.action.description,
            attributes: event.attributes
        )
    }
}
