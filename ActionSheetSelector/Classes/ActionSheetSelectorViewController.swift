//
//  ActionSheetSelectorViewController.swift
//  ActionSheetSelector
//
//  Created by MAXIM DOROSHENKO on 29.09.2020.
//

import UIKit

public class ActionSheetSelectorViewController<T: CellItem>: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet private weak var titleOffset: NSLayoutConstraint!

    fileprivate var items: [T]!
    fileprivate var onSelect: ((T) -> Void)!
    fileprivate var cellStyle = CellStyleConfig()
    fileprivate var style = StyleConfig()
    private let animationDuration: TimeInterval = 0.2
    private let emptyViewAlpha: CGFloat = 0.2 // TODO: Move to style

    public static func present(parent: UIViewController,
                               style: StyleConfig = StyleConfig(),
                               cellStyle: CellStyleConfig = CellStyleConfig(),
                               title: String? = nil,
                               items: [T],
                               onSelect: @escaping (T) -> Void) {
        let controller = instantiate(style: style, cellStyle: cellStyle, title: title, items: items, onSelect: onSelect)
        controller.modalPresentationStyle = .overCurrentContext
        parent.present(controller, animated: false)
    }

    public static func instantiate(style: StyleConfig, cellStyle: CellStyleConfig, title: String?, items: [T], onSelect: @escaping (T) -> Void) -> ActionSheetSelectorViewController {
        let controller = ActionSheetSelectorViewController(nibName: "ActionSheetSelectorViewController", bundle: Bundle.resources)
        controller.cellStyle = cellStyle
        controller.style = style
        controller.items = items
        controller.onSelect = onSelect
        controller.loadViewIfNeeded()
        controller.config(style: style)
        controller.tableViewHeight.constant = 0
        controller.titleLabel.text = title
        controller.titleLabel.font = style.titleFont
        controller.titleLabel.textColor = style.titleColor
        controller.titleOffset.constant = style.titleOffset
        controller.contentView.backgroundColor = style.backgroundColor
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

    // MARK: UITableViewDataSource
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ItemTableViewCell
        cell.config(style: cellStyle, title: item.title)
        return cell
    }

    // MARK: UITableViewDelegate
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        onSelect(item)
        dismiss()
    }
}
