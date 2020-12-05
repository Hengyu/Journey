//
//  BaseJourneyLoggerBuilder.swift
//
//
//  Created by hengyu on 2020/12/5.
//  Copyright © 2020 hengyu. All rights reserved.
//

import Foundation
import JourneyInterface

public final class BaseJourneyLoggerBuilder: JourneyLoggerBuilder {
    public let dependencies: JourneyDependencies

    public init(dependencies: JourneyDependencies) {
        self.dependencies = dependencies
    }

    public func build() -> JourneyLogger {
        BaseJourneyLogger(
            networkService: dependencies.networkLoggingService,
            ondiskService: dependencies.ondiskLoggingService
        )
    }
}
