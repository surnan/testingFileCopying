//
//  TaskList+TableViewController.swift
//  File_Copy_Test
//
//  Created by admin on 7/23/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class TaskListVC: UITableViewController {
    
    struct CoreDataStruct {
        var name: String
        var parent: String
    }
    
    var names = [CoreDataStruct]()
    
    
    func loadNamesArray(){
        names.append(CoreDataStruct(name: "Weekends", parent: "Friday"))
        names.append(CoreDataStruct(name: "Weekdays", parent: "Sunday"))
        names.append(CoreDataStruct(name: "Hump Day", parent: "Tuesday"))
        names.append(CoreDataStruct(name: "Pay Day", parent: "14"))
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNamesArray()
        tableView.register(TaskCell.self, forCellReuseIdentifier: "myCell")
    }
    
    
}
