//
//  TaskCell.swift
//  File_Copy_Test
//
//  Created by admin on 7/23/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {
    
    var nameLabel: UILabel = {
       var tempLabel = UILabel()
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        return tempLabel
    }()
    
    var parentLabel: UILabel = {
        var tempLabel = UILabel()
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        return tempLabel
    }()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        [nameLabel, parentLabel].forEach{addSubview($0)}
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            parentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 250),
            parentLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
