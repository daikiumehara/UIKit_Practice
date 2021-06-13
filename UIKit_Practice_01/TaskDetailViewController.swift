//
//  TaskDetailViewController.swift
//  UIKit_Practice_01
//
//  Created by daiki umehara on 2021/06/13.
//

import UIKit

class TaskDetailViewController: UIViewController {
    enum TaskRow: Int, CaseIterable {
        case title, date, time, notes

        func displayText(for reminder: Reminder?) -> String? {
            switch self {
            case .title:
                return reminder?.title
            case .date:
                return reminder?.dueDate.description
            case .time:
                return reminder?.dueDate.description
            case .notes:
                return reminder?.notes
            }
        }

        var cellImage: UIImage? {
            switch self {
            case .title:
                return nil
            case .date:
                return UIImage(systemName: "calendar.circle")
            case .time:
                return UIImage(systemName: "clock")
            case .notes:
                return UIImage(systemName: "square.and.pencil")
            }
        }
    }
    var reminder: Reminder?

    func configure(with reminder: Reminder) {
        self.reminder = reminder
    }
    
}

extension TaskDetailViewController: UITableViewDelegate {

}

extension TaskDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskRow.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskCell.identifier, for: indexPath) as! TaskCell
        let row = TaskRow(rawValue: indexPath.row)
        cell.textLabel?.text = row?.displayText(for: reminder)
        cell.imageView?.image = row?.cellImage
        return cell
    }
}
