//
//  StyleConfig.swift
//  ActionSheetSelector
//
//  Created by MAXIM DOROSHENKO on 01.10.2020.
//

import Foundation

public struct StyleConfig {
    let cellHeight: CGFloat
    let cornerRadius: CGFloat

    public init(cellHeight: CGFloat = 40, cornerRadius: CGFloat = 16) {
        self.cellHeight = cellHeight
        self.cornerRadius = cornerRadius
    }
}
