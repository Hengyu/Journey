//
//  JourneyVersion.swift
//
//
//  Created by hengyu on 2020/12/5.
//  Copyright © 2020 hengyu. All rights reserved.
//

import Foundation
import JourneyInterface

public enum JourneyVersion: String, JourneyVersioning {
    case version1

    public var description: String {
        rawValue
    }
}
