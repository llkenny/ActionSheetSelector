//
//  StyleConfig.swift
//  ActionSheetSelector
//
//  Created by MAXIM DOROSHENKO on 01.10.2020.
//

import Foundation

/// Style configration for the main view
public struct StyleConfig {
    /// Title font
    let titleFont: UIFont
    /// Title color
    let titleColor: UIColor
    /// Title left offset
    let titleOffset: CGFloat
    /// Background color
    let backgroundColor: UIColor
    /// Cell height
    let cellHeight: CGFloat
    /// Sheet corner radius
    let cornerRadius: CGFloat
    /// Darkening effect transparency
    let emptyAlpha: CGFloat

    public init(titleFont: UIFont = UIFont.systemFont(ofSize: 17, weight: .semibold),
                titleColor: UIColor = UIColor.black,
                titleOffset: CGFloat = 48,
                backgroundColor: UIColor = UIColor.white,
                cellHeight: CGFloat = 40,
                cornerRadius: CGFloat = 16,
                emptyAlpha: CGFloat = 0.2) {
        self.titleFont = titleFont
        self.titleColor = titleColor
        self.titleOffset = titleOffset
        self.backgroundColor = backgroundColor
        self.cellHeight = cellHeight
        self.cornerRadius = cornerRadius
        self.emptyAlpha = emptyAlpha
    }
}
