//
//  TaskDetailEditDataSource.swift
//  UIKit_Practice_01
//
//  Created by daiki umehara on 2021/06/22.
//

import UIKit

class TaskDetailEditDataSource: NSObject {
    enum TaskSection: Int, CaseIterable {
        case title, dueDate, notes

        var displayText: String {
            switch self {
            case .title:
                return "Title"
            case .dueDate:
                return "Date"
            case .notes:
                return "Notes"
            }
        }

        var numRows: Int {
            switch self {
            case .title, .notes: return 1
            case .dueDate: return 2
            }
        }

        func cellIdentifier(for row: Int) -> String {
            switch self {
            case .title:
                return "EditTitleCell"
            case .dueDate:
                return row == 0 ? "EditDateLabelCell" : "EditDateCell"
            case .notes:
                return "EditNotesCell"
            }
        }
    }

    static var dateLabelCellIdentifier: String {
        return TaskSection.dueDate.cellIdentifier(for: 0)
    }

    var reminder: Reminder

    init(reminder: Reminder) {
        self.reminder = reminder
    }

    //ここ
    private func dequeueAndConfigureCell(for indexPath: IndexPath, from tableView: UITableView) -> UITableViewCell {
        guard let section = TaskSection(rawValue: indexPath.section) else {
            fatalError("section index out of range")
        }
        let identifier = section.cellIdentifier(for: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)

        switch section {
        case .title:
            if let titleCell = cell as? EditTitleCell {
                titleCell.configure(title: reminder.title)
            }
        case .dueDate:
            if indexPath.row == 0 {
                cell.textLabel?.text = reminder.dueDate.description
            } else {
                if let dueDateCell = cell as? EditDateCell {
                    dueDateCell.configure(date: reminder.dueDate)
                }
            }
            if let notesCell = cell as? EditNotesCell {
                notesCell.configure(notes: reminder.notes)
            }
        case .notes:
            if let notesCell = cell as? EditNotesCell {
                notesCell.configure(notes: reminder.notes)
            }
        }
        return cell
    }
}

extension TaskDetailEditDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskSection(rawValue: section)?.numRows ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return dequeueAndConfigureCell(for: indexPath, from: tableView)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        TaskSection.allCases.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let section = TaskSection(rawValue: section) else {
            fatalError("Section index out of range")
        }
        return section.displayText
    }
}
