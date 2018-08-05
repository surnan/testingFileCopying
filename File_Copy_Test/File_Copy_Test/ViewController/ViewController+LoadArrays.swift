//
//  ViewController+LoadArrays.swift
//  File_Copy_Test
//
//  Created by admin on 8/1/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

extension ViewController {

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
//                print(fileURL.path, resourceValues.creationDate!, resourceValues.isDirectory!)
//                print(fileURL.path)
                

                if let image = getSavedImage(named: fileURL.lastPathComponent){
                    print("ADDING IMAGE TO ARRAY @ \(fileURL.path)")
                    fileImageArray.append(image)
                    
                    savedImageView.image = image
                    
//                    let tempVC = ImageVC()  //DOES NOT FIRE "PUSH"
//                    tempVC.theImage?.image = image
//                    navigationController?.pushViewController(tempVC, animated: true)
                }
//                print("------       fileIMAGEARRAY   ------")
//                print(fileImageArray)
            }
        } catch {
//            print(error)
        }
    }
    
    
    func getSavedImage(named: String) -> UIImage? {
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            
            let temp3 = URL(fileURLWithPath: dir.absoluteString)
            let temp2 = temp3.appendingPathComponent(named).path
            let temp = UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
            
//            print("INSIDE 'GETSAVEDIMAGE'")
//            print("named = \(named)")
            
            
            return temp
        }
        return nil
    }
}
