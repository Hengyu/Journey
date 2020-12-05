//
//  JourneyContext.swift
//
//
//  Created by hengyu on 2020/10/3.
//  Copyright © 2020 hengyu. All rights reserved.
//

import Foundation

public protocol JourneyContext: Codable, CustomStringConvertible {
    var session: JourneySession { get }
    var date: Date { get }
}
