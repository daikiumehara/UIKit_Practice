//
//  EdittitleCell.swift
//  UIKit_Practice_01
//
//  Created by daiki umehara on 2021/06/21.
//

import UIKit

class EditTitleCell: UITableViewCell {
    @IBOutlet var textField: UITextField!

    func configure(title: String) {
        textField.text = title
    }
}
