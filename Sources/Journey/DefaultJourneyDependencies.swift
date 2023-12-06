//
//  MIT License
//
//  Created by hengyu on 2020/12/5.
//  Copyright © 2021-2023 hengyu. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

#if canImport(DatadogCore)
import DatadogCore
import DatadogLogs
#endif

import Foundation
import JourneyInterface

public struct DatadogContext: Codable, Equatable, Hashable, Sendable {
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

public final class DatadogService: NetworkLoggingService, @unchecked Sendable {

    #if canImport(DatadogCore)
    private var loggers: [String: LoggerProtocol] = [:]

    private func logger(withName name: String) -> LoggerProtocol {
        if let logger = loggers[name] {
            return logger
        } else {
            let logger = Logger.create(
                with: .init(
                    service: context.serviceName,
                    name: name,
                    networkInfoEnabled: context.sendNetworkInfo,
                    consoleLogFormat: nil
                )
            )
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
        #if canImport(DatadogCore)
        Datadog.initialize(
            with: .init(clientToken: context.token, env: context.environment, service: context.serviceName),
            trackingConsent: .granted
        )
        Logs.enable()
        #endif
    }

    public func logEvent(_ name: String, content: String, attributes: [String: Encodable]) {
        #if canImport(DatadogCore)
        let log = logger(withName: name)
        log.info(content, attributes: attributes)
        #endif
    }
}

public final class DefaultOndiskService: OndiskLoggingService, Sendable {

    public func logEvent(_ name: String, content: String, attributes: [String: Encodable]) {
        debugPrint("log event \(name), content: \(content), attributes: \(attributes)")
    }
}

public final class DefaultJourneyDependencies: JourneyDependencies, Sendable {

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
