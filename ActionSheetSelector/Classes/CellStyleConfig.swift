//
//  CellStyleConfig.swift
//  ActionSheetSelector
//
//  Created by MAXIM DOROSHENKO on 30.09.2020.
//

import UIKit

/// Style configuration for the item cell
public struct CellStyleConfig {
    /// Spacing between icon and title
    let spacing: CGFloat
    /// Background color
    let backgroundColor: UIColor
    /// Title color
    let titleColor: UIColor
    /// Selected title color
    let titleSelectedColor: UIColor
    /// Title font
    let titleFont: UIFont
    /// Icon image
    let iconImage: UIImage?
    /// Number of lines for text label
    let numberOfLines: Int

    public init(spacing: CGFloat = 8,
         backgroundColor: UIColor = UIColor.white,
         titleColor: UIColor = UIColor.black,
         titleSelectedColor: UIColor = UIColor.blue,
         titleFont: UIFont = UIFont.systemFont(ofSize: 16),
         iconImage: UIImage? = nil,
         numberOfLines: Int = 1) {
        self.spacing = spacing
        self.backgroundColor = backgroundColor
        self.titleColor = titleColor
        self.titleFont = titleFont
        self.iconImage = iconImage
        self.titleSelectedColor = titleSelectedColor
        self.numberOfLines = numberOfLines
    }
}
