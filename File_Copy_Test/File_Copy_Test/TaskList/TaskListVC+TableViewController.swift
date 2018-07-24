//
//  TaskList+TableViewController.swift
//  File_Copy_Test
//
//  Created by admin on 7/23/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit


extension TaskListVC {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let tempCell = UITableViewCell()
//        tempCell.textLabel?.text = names[indexPath.row]
        
        let tempCell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! TaskCell
        tempCell.nameLabel.text = names[indexPath.row].name
        tempCell.parentLabel.text = names[indexPath.row].parent
        return tempCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(ViewController(), animated: true)
    }
    
}
