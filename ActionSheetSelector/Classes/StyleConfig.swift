//
//  StyleConfig.swift
//  ActionSheetSelector
//
//  Created by MAXIM DOROSHENKO on 01.10.2020.
//

import Foundation

public struct StyleConfig {
    let titleFont: UIFont
    let titleColor: UIColor
    let titleOffset: CGFloat
    let backgroundColor: UIColor
    let cellHeight: CGFloat
    let cornerRadius: CGFloat
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
