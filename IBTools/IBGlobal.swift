//
//  IBConstants.swift
//  IBTools
//
//  Created by Hugo Gonzalez on 11/23/16.
//  Copyright © 2016 Cat Bakery. All rights reserved.
//

import UIKit

// MARK: - Screen
let IS_IPAD = UIDevice.current.userInterfaceIdiom == .pad
let SCREEN_SIZE = UIScreen.main.bounds.size
let SCREEN_WIDTH = SCREEN_SIZE.width
let SCREEN_HEIGHT = SCREEN_SIZE.height
let SCREEN_SCALE = (SCREEN_WIDTH / 320.0)
func SCALED_SCREEN_SIZE(value: CGFloat) -> CGFloat {
    return value * SCREEN_SCALE
}
