//
//  TaskCell.swift
//  UIKit_Practice_01
//
//  Created by daiki umehara on 2021/06/11.
//

import UIKit

class TaskCell: UITableViewCell {

    typealias DoneButtonAction = () -> Void
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var doneButton: UIButton!
    @IBOutlet var dateLabel: UILabel!

    var doneButtonAction: DoneButtonAction?

    static var identifier: String { String(describing: self) }
    static var nib: UINib { UINib(nibName: String(describing: self), bundle: nil) }

    @IBAction func didTapDoneButton(_ sender: Any) {
        doneButtonAction?()
    }
}

extension TaskCell {
    func setup(title: String, date: Date) {

    }
}
