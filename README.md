# Journey

[`Journey`](https://github.com/Hengyu/Journey) is a package for logging. It contains two libraries: The one is `JourneyInterface` which defines a set of protocols. And the other is `Journey` which provides a base implementation of the previous protocols.

There are two types of logger protocols: `NetworkLoggingService` and `OndiskLoggingService`.

- The `DatadogService` is a pre-built network logger on the `NetworkLoggingService`. You should add the [`dd-sdk-ios`](https://github.com/DataDog/dd-sdk-ios) to your project dependencies when you try to use it.

- The `DefaultOndiskService` is a pre-built local logger on the `OndiskLoggingService`. It  simply prints logging info to the console.

## Installation

`Journey` could be installed via [Swift Package Manager](https://www.swift.org/package-manager/). Open Xcode and go to **File** -> **Add Packages...**, search `https://github.com/hengyu/Journey.git`, and add the package as one of your project's dependency.

## Usage

```swift
import Journey
import JourneyInterface

public final class CustomJourneyDependencies: JourneyDependencies {

    private class CustomOndiskLoggingService: OndiskLoggingService {

        func logEvent(_ name: String, content: String, attributes: [String: Encodable]) { }
    }

    public let datadogContext: DatadogContext

    public init(datadogContext: DatadogContext) {
        self.datadogContext = datadogContext
    }

    public var networkLoggingService: NetworkLoggingService {
        DatadogService(context: datadogContext)
    }

    public var ondiskLoggingService: OndiskLoggingService {
        CustomOndiskLoggingService()
    }
}

extension BaseJourneyLogger {

    public static let sharedLogger: JourneyLogger = {
        BaseJourneyLoggerBuilder(
            dependencies: CustomJourneyDependencies(
                datadogContext: DatadogContext(
                    serviceName: <#T##String#>,
                    environment: <#T##String#>,
                    token: <#T##String#>,
                    sendNetworkInfo: true
                )
            )
        ).build()
    }()
}

// when you want to log
BaseJourneyLogger.sharedLogger.logEvent(JourneyPageImpressionEvent(page: _page_))
```

## License
`Journey` is released under the [MIT License](LICENSE).
