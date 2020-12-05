//
//  JourneyLoggerBuilder.swift
//
//
//  Created by hengyu on 2020/12/5.
//  Copyright © 2020 hengyu. All rights reserved.
//

import Foundation

public protocol NetworkLoggingService {

    func initialize()
    func logEvent(_ name: String, content: String, attributes: [String: Encodable])
}

public protocol NetworkLoggingServiceProviding {

    var networkLoggingService: NetworkLoggingService { get }
}

public protocol OndiskLoggingService {

    func logEvent(_ name: String, content: String, attributes: [String: Encodable])
}

public protocol OndiskLoggingServiceProviding {

    var ondiskLoggingService: OndiskLoggingService { get }
}

public typealias JourneyDependencies = NetworkLoggingServiceProviding & OndiskLoggingServiceProviding

public protocol JourneyLoggerBuilder {

    var dependencies: JourneyDependencies { get }

    func build() -> JourneyLogger
}
