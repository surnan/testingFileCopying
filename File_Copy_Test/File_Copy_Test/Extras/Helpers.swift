//
//  Helpers.swift
//  File_Copy_Test
//
//  Created by admin on 8/1/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation

func loadFileArray(){
    print("LOAD_FILE_ARRAY")
    
    let fileManager = FileManager.default
    
    do {
        let resourceKeys : [URLResourceKey] = [.creationDateKey, .isDirectoryKey]
        let documentsURL = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let enumerator = FileManager.default.enumerator(at: documentsURL,
                                                        includingPropertiesForKeys: resourceKeys,
                                                        options: [.skipsHiddenFiles], errorHandler: { (url, error) -> Bool in
                                                            print("directoryEnumerator error at \(url): ", error)
                                                            return true
        })!
        
        for case let fileURL as URL in enumerator {
            let resourceValues = try fileURL.resourceValues(forKeys: Set(resourceKeys))
            print(fileURL.path, resourceValues.creationDate!, resourceValues.isDirectory!)
        }
    } catch {
        print(error)
    }
}

//func setView() {
//    view = UIView()
//    view.frame = UIScreen.main.bounds
//    view.backgroundColor = UIColor.blue
//}
