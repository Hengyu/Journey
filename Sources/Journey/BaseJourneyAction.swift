//
//  BaseJourneyAction.swift
//
//
//  Created by hengyu on 2020/10/3.
//  Copyright © 2020 hengyu. All rights reserved.
//

import Foundation
import JourneyInterface

public enum BaseJourneyAction: String, CaseIterable, JourneyAction {
    case impression
    case click
    case valueChanged
    case swipe
    case doubleTap
    case longPress
    case pan
    case drag
    case drop

    public var description: String {
        rawValue
    }
}
