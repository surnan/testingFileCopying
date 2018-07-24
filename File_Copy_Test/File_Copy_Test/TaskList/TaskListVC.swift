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
        view.backgroundColor = UIColor.black
        loadNamesArray()
        setupNavigationBar()
        tableView.register(TaskCell.self, forCellReuseIdentifier: "myCell")
    }
    
    //MARK:- ----NAVIGATION BARS-----
    func setupNavigationBar(){
        navigationItem.title = "TASKS"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(handleLeftBarButton))
        
//        UINavigationBar.appearance().barTintColor = UIColor.lightRed
//        UINavigationBar.appearance().tintColor = UIColor.white
    }
    
    @objc func handleLeftBarButton(){
        print("left button selected")
    }
    
    
    
    
}
