//
//  ViewController.swift
//  ActionSheetSelector
//
//  Created by Maxim Doroshenko on 09/29/2020.
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
}
