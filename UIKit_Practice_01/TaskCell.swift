//
//  TaskCell.swift
//  UIKit_Practice_01
//
//  Created by daiki umehara on 2021/06/12.
//

import UIKit

class TaskCell: UITableViewCell {
    typealias DoneButtonAction = () -> Void
    @IBOutlet var doneButton: UIButton!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!

    private var doneButtonAction: DoneButtonAction?

    static var identifier: String { String(describing: self) }
    static var nib: UINib { UINib(nibName: String(describing: self), bundle: nil) }

    @IBAction func didTapDoneButton(_ sender: Any) {
        doneButtonAction?()
    }
}

extension TaskCell {
    func setup(task: Reminder, buttonAction: @escaping DoneButtonAction) {
        titleLabel.text = task.title
        dateLabel.text = task.dueDate.description
        doneButton.setBackgroundImage(task.isComplete ? UIImage(systemName: "circle.fill") : UIImage(systemName: "circle"),
                                      for: .normal)
        doneButtonAction = buttonAction
    }
    
}
