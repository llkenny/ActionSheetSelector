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
    let backgroundColor: UIColor
    let cellHeight: CGFloat
    let cornerRadius: CGFloat

    public init(titleFont: UIFont = UIFont.systemFont(ofSize: 17, weight: .semibold),
                titleColor: UIColor = UIColor.black,
                backgroundColor: UIColor = UIColor.white,
                cellHeight: CGFloat = 40,
                cornerRadius: CGFloat = 16) {
        self.titleFont = titleFont
        self.titleColor = titleColor
        self.backgroundColor = backgroundColor
        self.cellHeight = cellHeight
        self.cornerRadius = cornerRadius
    }
}
