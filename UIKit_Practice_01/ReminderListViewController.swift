//
//  ViewController.swift
//  UIKit_Practice_01
//
//  Created by daiki umehara on 2021/06/11.
//

import UIKit

class ReminderListViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    private lazy var dateFormatter = RelativeDateTimeFormatter()
    private var delegate: ReminderListDelegate?
    private var dataSource: ReminderListDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = ReminderListDelegate(self)
        tableView.delegate = delegate
        dataSource = ReminderListDataSource()
        tableView.dataSource = dataSource
        tableView.register(TaskCell.nib, forCellReuseIdentifier: TaskCell.identifier)
    }
}

extension ReminderListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = TaskDetailViewController.instantiate(with: Reminder.testData[indexPath.row])
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

