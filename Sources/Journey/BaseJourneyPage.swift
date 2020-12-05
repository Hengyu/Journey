//
//  BaseJourneyPage.swift
//
//
//  Created by hengyu on 2020/10/3.
//  Copyright © 2020 hengyu. All rights reserved.
//

import Foundation
import JourneyInterface

open class BaseJourneyPage: JourneyPage {

    public let rawValue: String

    public required init?(rawValue: String) {
        self.rawValue = rawValue
    }
}
