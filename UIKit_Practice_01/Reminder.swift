//
//  Reminder.swift
//  UIKit_Practice_01
//
//  Created by daiki umehara on 2021/06/11.
//

import Foundation

struct Reminder: Comparable {
    var title: String
    var dueDate: Date
    var notes: String? = nil
    var isComplete: Bool = false
    var views: Int

    static func < (lhs: Reminder, rhs: Reminder) -> Bool {
        lhs.views < rhs.views
    }
}

extension Reminder  {
    static var testData = [
        Reminder(title: "Submit reimbursement report", dueDate: Date().addingTimeInterval(800.0), notes: "Don't forget about taxi receipts", views: 30),
        Reminder(title: "Code review", dueDate: Date().addingTimeInterval(14000.0), notes: "Check tech specs in shared folder", isComplete: true, views: 20),
            Reminder(title: "Pick up new contacts", dueDate: Date().addingTimeInterval(24000.0), notes: "Optometrist closes at 6:00PM", views: 100),
            Reminder(title: "Add notes to retrospective", dueDate: Date().addingTimeInterval(3200.0), notes: "Collaborate with project manager", isComplete: true , views: 10),
            Reminder(title: "Interview new project manager candidate", dueDate: Date().addingTimeInterval(60000.0), notes: "Review portfolio", views: 5),
        Reminder(title: "Mock up onboarding experience", dueDate: Date().addingTimeInterval(72000.0), notes: "Think different", views: 28),
            Reminder(title: "Review usage analytics", dueDate: Date().addingTimeInterval(83000.0), notes: "Discuss trends with management", views: 95),
            Reminder(title: "Confirm group reservation", dueDate: Date().addingTimeInterval(92500.0), notes: "Ask about space heaters", views: 39),
            Reminder(title: "Add beta testers to TestFlight", dueDate: Date().addingTimeInterval(101000.0),  notes: "v0.9 out on Friday", views: 17)
        ]
}
