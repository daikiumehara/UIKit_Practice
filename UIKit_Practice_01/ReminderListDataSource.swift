//
//  ReminderListDataSource.swift
//  UIKit_Practice_01
//
//  Created by daiki umehara on 2021/06/15.
//

import UIKit

class ReminderListDataSource: NSObject {
    
}

extension ReminderListDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Reminder.testData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskCell.identifier, for: indexPath) as! TaskCell
        let task = Reminder.testData[indexPath.row]
        cell.setup(task: task) {
            Reminder.testData[indexPath.row].isComplete.toggle()
            tableView.reloadData()
        }
        return cell
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        100.0
    }
}
