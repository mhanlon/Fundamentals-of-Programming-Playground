
//
//  CheckboxInputCell.swift
//
//

import UIKit

class CheckboxInputCell : PopoverInputCell {
    private let checkboxButton = UISwitch()
    
    class override var reuseIdentifier: String {
        return "CheckboxInputCell"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        valueType = .bool
        checkboxButton.addTarget(self, action: #selector(CheckboxInputCell.valueDidChange), for: .valueChanged)
//        datePicker.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        checkboxButton.frame = popoverViewController.view.bounds
        popoverViewController.view.addSubview(checkboxButton)
        // Center the switch for now...
        let oldFrame = checkboxButton.frame
        checkboxButton.frame = CGRect(x: oldFrame.origin.x+20, y: oldFrame.origin.y+20, width: oldFrame.size.width, height: oldFrame.size.height)
        let smallestSize = checkboxButton.intrinsicContentSize
        popoverContentSize = CGSize(width:smallestSize.width+40, height: smallestSize.height+20)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func valueDidChange() {
        messageText = checkboxButton.isOn.description
    }
}
