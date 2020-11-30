//
//  ViewController.swift
//  ActionSheetSelector
//
//  Created by Maxim Doroshenko on 09/29/2020.a
//  Copyright (c) 2020 Maxim Doroshenko. All rights reserved.
//

import UIKit
import ActionSheetSelector

final class ViewController: UIViewController {

    @IBAction func showButtonTouch(_ sender: Any) {
        let image = UIImage(named: "checked")!
        let cellStyle = CellStyleConfig(titleSelectedColor: UIColor(red: 0, green: 0.37, blue: 0.72, alpha: 1), iconImage: image)
        let items = Array(1...5).map { Item(id: String($0), title: String($0)) }
        ActionSheetSelectorViewController.present(parent: self, cellStyle: cellStyle, title: "Test", items: items, selected: 1) { item in
            debugPrint(item)
        }
    }

    @IBAction func showMultilineButtonTouch(_ sender: Any) {
        let image = UIImage(named: "checked")!
        let cellStyle = CellStyleConfig(titleSelectedColor: UIColor(red: 0, green: 0.37, blue: 0.72, alpha: 1), iconImage: image, numberOfLines: 0)
        let items = [Item(id: "1", title: "Verylongline Verylongline Verylongline"),
                     Item(id: "2", title: "Verylongline Verylongline Verylongline Verylongline Verylongline Verylongline Verylongline Verylongline Verylongline Verylongline Verylongline"),
                     Item(id: "3", title: "Verylongline Verylongline"),
                     Item(id: "4", title: "Verylongline Verylongline Verylongline Verylongline Verylongline Verylongline Verylongline Verylongline"),
        ]
        let style = StyleConfig(cellHeight: nil)
        ActionSheetSelectorViewController.present(parent: self, style: style, cellStyle: cellStyle, title: "Test", items: items) { item in
            debugPrint(item)
        }
    }
}
