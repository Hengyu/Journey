//
//  JourneyLogger.swift
//
//
//  Created by hengyu on 2020/12/5.
//  Copyright © 2020 hengyu. All rights reserved.
//

import Foundation

public protocol JourneyLogger {

    func logEvent<T: JourneyEvent>(_ event: T)
}
