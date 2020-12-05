# Journey

`Journey` is a logging package contains an interface module and an instance module.

There are two logger type for logging: `NetworkLoggingService` and `OndiskLoggingService`.

- The `DatadogService` leverages the `Datadog` service and implements `NetworkLoggingService`;
- The `DefaultOndiskService` just prints logging info on the console.
