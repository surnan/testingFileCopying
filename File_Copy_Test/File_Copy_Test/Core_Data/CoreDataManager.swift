//
//  CoreDataManager.swift
//  File_Copy_Test
//
//  Created by admin on 7/23/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
import CoreData


struct CoreDataManager {
    static let shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer = {
        let myContainer = NSPersistentContainer(name: "CoreDataFile")
        myContainer.loadPersistentStores { (store, err) in
            if let err = err {
                fatalError("Loading of store failed: \(err)")
            }
        }
        return myContainer
    }()
}
