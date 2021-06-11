//
//  TaskCell.swift
//  UIKit_Practice_01
//
//  Created by daiki umehara on 2021/06/11.
//

import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!

    static var identifier: String { String(describing: self) }
    static var nib: UINib { UINib(nibName: String(describing: self), bundle: nil) }

}

extension TaskCell {
    func setup(title: String, date: Date) {
        
    }
}
