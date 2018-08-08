//
//  ViewController+LoadArrays2.swift
//  File_Copy_Test
//
//  Created by admin on 8/5/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

extension ViewController {
    
    func loadFileArray2(){
        
        let myFileManager = FileManager.default
        let properties = [URLResourceKey.localizedNameKey,
                          URLResourceKey.nameKey,
                          URLResourceKey.pathKey,
                          URLResourceKey.canonicalPathKey]
        
        let documentsURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let taskParentFolderPathURL = documentsURL.appendingPathComponent(taskFolder!)
        let myDocumentsFolder = FileManager.default.enumerator(at: documentsURL, includingPropertiesForKeys: properties, options: .skipsHiddenFiles) { (url, error) -> Bool in
            print("URL = \(url) gives error: ", error)
            return true
        }
        
        do {
            let imageURL = try FileManager.default.contentsOfDirectory(at: taskParentFolderPathURL, includingPropertiesForKeys: properties, options: .skipsHiddenFiles)
            print("image URL = \(imageURL)")
            
            for eachFile in imageURL {
                if let tempFile = UIImage(named: eachFile.path)  //named = file Name
                {
                    fileImageArray.append(tempFile)
                    fileImageUNCStringArray.append(eachFile.path)
                }
            }
            
            
            
            
            
            
            
            
             let tempVC = ImageVC()
//            let tempVC = ImageVC2()
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            tempVC.allImages = fileImageArray
            tempVC.allImagePaths = fileImageUNCStringArray
                
                
            navigationController?.pushViewController(tempVC, animated: true)
        } catch {}
        
        print(properties, myFileManager)  //DUMMY LINE
    }
}



