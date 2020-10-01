//
//  Bundle+Resources.swift
//  ActionSheetSelector
//
//  Created by MAXIM DOROSHENKO on 01.10.2020.
//

import Foundation

extension Bundle {
    static var resources: Bundle? {
        guard let path = Bundle(for: ActionSheetSelectorViewController.self).path(forResource: "ActionSheetSelector", ofType: "bundle") else {
            return nil
        }
        return Bundle(path: path)
    }
}
