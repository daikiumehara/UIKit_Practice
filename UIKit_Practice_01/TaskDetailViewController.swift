//
//  TaskDetailViewController.swift
//  UIKit_Practice_01
//
//  Created by daiki umehara on 2021/06/13.
//

import UIKit

class TaskDetailViewController: UIViewController {
    @IBOutlet private var tableView: UITableView!
    private var taskDetailDataSource: TaskDetailDataSource?
    private var reminder: Reminder?
    
    static func instantiate(with reminder: Reminder) -> TaskDetailViewController {
        let detailVC = UIStoryboard(name: "Detail", bundle: nil)
            .instantiateInitialViewController() as! TaskDetailViewController
        detailVC.reminder = reminder
        return detailVC
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        taskDetailDataSource = TaskDetailDataSource()
        tableView.dataSource = taskDetailDataSource
    }
}

extension TaskDetailViewController: UITableViewDelegate {

}
