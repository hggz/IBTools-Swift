//
//  IBConstants.swift
//  IBTools
//
//  Created by Hugo Gonzalez on 11/23/16.
//  Copyright © 2016 Cat Bakery. All rights reserved.
//

import UIKit

// MARK: - Screen
public let IS_IPAD = UIDevice.current.userInterfaceIdiom == .pad
public let SCREEN_SIZE = UIScreen.main.bounds.size
public let SCREEN_WIDTH = SCREEN_SIZE.width
public let SCREEN_HEIGHT = SCREEN_SIZE.height
public let SCREEN_SCALE = (SCREEN_WIDTH / 320.0)
public func SCALED_SCREEN_SIZE(value: CGFloat) -> CGFloat {
    return value * SCREEN_SCALE
}
