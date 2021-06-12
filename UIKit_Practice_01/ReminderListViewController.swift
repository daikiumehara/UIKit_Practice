//
//  ViewController.swift
//  UIKit_Practice_01
//
//  Created by daiki umehara on 2021/06/11.
//

import UIKit

class ReminderListViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TaskCell.nib, forCellReuseIdentifier: TaskCell.identifier)
    }
}

extension ReminderListViewController: UITableViewDelegate {

}

extension ReminderListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Reminder.testData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskCell.identifier, for: indexPath) as! TaskCell
        let task = Reminder.testData[indexPath.row]
        cell.setup(task: task) { [weak self] in
            guard let self = self else { return }
            Reminder.testData[indexPath.row].isComplete.toggle()
            self.tableView.reloadData()
        }
        return cell
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        100.0
    }
}

