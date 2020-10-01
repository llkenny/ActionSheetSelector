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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    @IBAction func showButtonTouch(_ sender: Any) {
        let image = UIImage(named: "checked")!
        let cellStyle = CellStyleConfig(iconImage: image)
        ActionSheetSelectorViewController.present(parent: self, cellStyle: cellStyle, items: Array(repeating: "3", count: 5)) { item in
            debugPrint(item)
        }
    }
}
