//
//  ItemTableViewCell.swift
//  ActionSheetSelector
//
//  Created by MAXIM DOROSHENKO on 30.09.2020.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    private var titleColor = UIColor.black

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        iconImageView.alpha = selected ? 1 : 0
        titleLabel.textColor = selected ? UIColor.blue : titleColor // TODO: Provide custom selected color
    }

    func config(style: CellStyleConfig = CellStyleConfig(), title: String) {
        stackView.spacing = style.spacing
        backgroundColor = style.backgroundColor
        titleLabel.textColor = style.titleColor
        titleLabel.font = style.titleFont

        iconImageView.image = style.iconImage
        titleLabel.text = title

        titleColor = style.titleColor
    }
}
