//
//  String+Bounds.swift
//  ActionSheetSelector
//
//  Created by MAXIM DOROSHENKO on 23.11.2020.
//
//  Thanks to: https://stackoverflow.com/a/30450559/3484997

extension String {

    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)

        return ceil(boundingBox.height)
    }
}
