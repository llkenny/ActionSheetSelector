//
//  CellStyleConfig.swift
//  ActionSheetSelector
//
//  Created by MAXIM DOROSHENKO on 30.09.2020.
//

import UIKit

public struct CellStyleConfig {
    let spacing: CGFloat
    let backgroundColor: UIColor
    let titleColor: UIColor
    let titleSelectedColor: UIColor
    let titleFont: UIFont
    let iconImage: UIImage?

    public init(spacing: CGFloat = 8,
         backgroundColor: UIColor = UIColor.white,
         titleColor: UIColor = UIColor.black,
         titleSelectedColor: UIColor = UIColor.blue,
         titleFont: UIFont = UIFont.systemFont(ofSize: 16),
         iconImage: UIImage? = nil) {
        self.spacing = spacing
        self.backgroundColor = backgroundColor
        self.titleColor = titleColor
        self.titleFont = titleFont
        self.iconImage = iconImage
        self.titleSelectedColor = titleSelectedColor
    }
}
