//
//  ReminderListDelegate.swift
//  UIKit_Practice_01
//
//  Created by daiki umehara on 2021/06/15.
//

import Foundation
import UIKit

class ReminderListDelegate: NSObject {
    private weak var vc: UIViewController?

    init(_ vc: UIViewController) {
        self.vc = vc
    }
}

extension ReminderListDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = TaskDetailViewController.instantiate(with: Reminder.testData[indexPath.row])
        vc?.navigationController?.pushViewController(nextVC, animated: true)
    }
}
