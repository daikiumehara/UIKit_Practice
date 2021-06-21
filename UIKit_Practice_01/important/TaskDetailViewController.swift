//
//  TaskDetailViewController.swift
//  UIKit_Practice_01
//
//  Created by daiki umehara on 2021/06/13.
//

import UIKit

class TaskDetailViewController: UIViewController {
    @IBOutlet private var tableView: UITableView!
    private var dataSource: TaskDetailDataSource?
    private var reminder: Reminder?

    static func instantiate(with reminder: Reminder) -> TaskDetailViewController {
        let detailVC = UIStoryboard(name: "Detail", bundle: nil)
            .instantiateInitialViewController() as! TaskDetailViewController
        detailVC.reminder = reminder
        return detailVC
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setEditing(false, animated: false)
        //ここ
        navigationItem.setRightBarButton(editButtonItem, animated: false)
        tableView.register(UITableViewCell.self, forHeaderFooterViewReuseIdentifier: TaskDetailEditDataSource.dateLabelCellIdentifier)
    }

    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        guard let reminder = reminder else {
            fatalError("No reminder found for detail view")
        }
        if editing {
            dataSource = TaskDetailEditDataSource(reminder: reminder)
        } else {
            dataSource = TaskDetailDataSource(reminder: reminder)
        }
        tableView.dataSource = dataSource
        tableView.reloadData()
    }
}
