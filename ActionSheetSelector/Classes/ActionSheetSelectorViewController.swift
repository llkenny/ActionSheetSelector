//
//  ActionSheetSelectorViewController.swift
//  ActionSheetSelector
//
//  Created by MAXIM DOROSHENKO on 29.09.2020.
//

import UIKit

public class ActionSheetSelectorViewController: UIViewController {
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var titleLabel: UILabel!

    fileprivate var items: [String]! // TODO: Convert to generics
    fileprivate var onSelect: ((String) -> Void)!
    fileprivate var cellStyle = CellStyleConfig()
    fileprivate var style = StyleConfig()
    private let animationDuration: TimeInterval = 0.2
    private let emptyViewAlpha: CGFloat = 0.2 // TODO: Move to style
    // TODO: Add bottom safe with save color as tableView

    public static func present(parent: UIViewController,
                               style: StyleConfig = StyleConfig(),
                               cellStyle: CellStyleConfig = CellStyleConfig(),
                               title: String? = nil,
                               items: [String],
                               onSelect: @escaping (String) -> Void) {
        let controller = instantiate(style: style, cellStyle: cellStyle, title: title, items: items, onSelect: onSelect)
        controller.modalPresentationStyle = .overCurrentContext
        parent.present(controller, animated: false)
    }

    public static func instantiate(style: StyleConfig, cellStyle: CellStyleConfig, title: String?, items: [String], onSelect: @escaping (String) -> Void) -> ActionSheetSelectorViewController {
        let controller = ActionSheetSelectorViewController(nibName: String(describing: ActionSheetSelectorViewController.self), bundle: Bundle.resources)
        controller.cellStyle = cellStyle
        controller.style = style
        controller.items = items
        controller.onSelect = onSelect
        controller.loadViewIfNeeded()
        controller.config(style: style)
        controller.tableViewHeight.constant = 0
        controller.titleLabel.text = title
        return controller
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
    }

    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableViewHeight.constant = CGFloat(items.count) * style.cellHeight
        UIView.animate(withDuration: animationDuration, animations: {
            self.emptyView.alpha = self.emptyViewAlpha
            self.view.layoutIfNeeded()
        })
    }

    @IBAction func emptyViewTouch(_ sender: UITapGestureRecognizer) {
        dismiss()
    }

    private func registerCell() {
        let nib = UINib(nibName: String(describing: ItemTableViewCell.self), bundle: Bundle.resources)
        tableView.register(nib, forCellReuseIdentifier: "cell")
    }

    fileprivate func config(style: StyleConfig) {
        tableView.rowHeight = style.cellHeight
        contentView.layer.cornerRadius = style.cornerRadius
        contentView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }

    private func dismiss() {
        tableViewHeight.constant = 0
        UIView.animate(withDuration: animationDuration, animations: {
            self.emptyView.alpha = 0
            self.view.layoutIfNeeded()
        }) { [weak self] _ in
            self?.dismiss(animated: false)
        }
    }
}

extension ActionSheetSelectorViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ItemTableViewCell
        cell.config(style: cellStyle, title: item)
        return cell
    }
}

extension ActionSheetSelectorViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        onSelect(item)
    }
}
