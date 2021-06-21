//
//  EditNotesCell.swift
//  UIKit_Practice_01
//
//  Created by daiki umehara on 2021/06/21.
//

import UIKit

class EditNotesCell: UITableViewCell {
    @IBOutlet var textView: UITextView!

    func configure(notes: String?) {
        textView.text = notes
    }
}
