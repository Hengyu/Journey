//
//  DefaultJourneyDependencies.swift
//
//
//  Created by hengyu on 2020/12/5.
//  Copyright © 2020 hengyu. All rights reserved.
//

#if canImport(Datadog)
import Datadog
#endif

import Foundation
import JourneyInterface

public struct DatadogContext {
    public let serviceName: String
    public let environment: String
    public let token: String
    public let sendNetworkInfo: Bool

    public init(serviceName: String, environment: String, token: String, sendNetworkInfo: Bool = true) {
        self.serviceName = serviceName
        self.environment = environment
        self.token = token
        self.sendNetworkInfo = sendNetworkInfo
    }
}

public class DatadogService: NetworkLoggingService {

    #if canImport(Datadog)
    private var loggers: [String: Logger] = [:]

    private func logger(withName name: String) -> Logger {
        if let logger = loggers[name] {
            return logger
        } else {
            let logger = Logger.builder
                .sendNetworkInfo(context.sendNetworkInfo)
                .sendLogsToDatadog(true)
                .set(loggerName: name)
                .set(serviceName: context.serviceName)
                .build()
            loggers[name] = logger
            return logger
        }
    }
    #endif

    private let context: DatadogContext

    public init(context: DatadogContext) {
        self.context = context
    }

    public func initialize() {
        #if canImport(Datadog)
        Datadog.initialize(
            appContext: .init(),
            configuration: Datadog.Configuration
                .builderUsing(
                    clientToken: context.token,
                    environment: context.environment
                )
                .build()
        )
        #endif
    }

    public func logEvent(_ name: String, content: String, attributes: [String: Encodable]) {
        let log = logger(withName: name)
        log.info(content, attributes: attributes)
    }
}

public class DefaultOndiskService: OndiskLoggingService {

    public func logEvent(_ name: String, content: String, attributes: [String: Encodable]) {
        debugPrint("log event \(name), content: \(content), attributes: \(attributes)")
    }
}

public final class DefaultJourneyDependencies: JourneyDependencies {

    public let datadogContext: DatadogContext

    public init(datadogContext: DatadogContext) {
        self.datadogContext = datadogContext
    }

    public var networkLoggingService: NetworkLoggingService {
        DatadogService(context: datadogContext)
    }

    public var ondiskLoggingService: OndiskLoggingService {
        DefaultOndiskService()
    }
}
