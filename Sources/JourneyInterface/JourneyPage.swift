//
//  JourneyPage.swift
//
//
//  Created by hengyu on 2020/10/2.
//  Copyright © 2020 hengyu. All rights reserved.
//

import Foundation

public protocol JourneyPage: RawRepresentable, CustomStringConvertible, Codable where RawValue == String { }

extension JourneyPage {

    public var description: String {
        rawValue
    }
}
