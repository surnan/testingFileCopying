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
                }
            }
        } catch {}
        
        
        
        /*
        //////////////////////////////////////////
        //////////////////////////////////////////
        //////////////////////////////////////////
        //////////////////////////////////////////
        //////////////////////////////////////////
        if let path = Bundle.main.resourcePath {  //+1
            let imagePath = path + "/images"
            let url = NSURL(fileURLWithPath: imagePath)
            let fileManager = FileManager.default
            
            let properties = [URLResourceKey.localizedNameKey,
                              URLResourceKey.creationDateKey,
                              URLResourceKey.localizedTypeDescriptionKey]
            
            do {  //+2
                let imageURLs = try fileManager.contentsOfDirectory(at: url as URL, includingPropertiesForKeys: properties, options:FileManager.DirectoryEnumerationOptions.skipsHiddenFiles)
                
                print("image URLs: \(imageURLs)")
                // Create image from URL
                let firstImageURL = imageURLs[0]
                let firstImageData = try Data(contentsOf: firstImageURL)
                let firstImage = UIImage(data: firstImageData)
                
                // Do something with first image
                
                
                
                
                
                print(firstImage!)  //DUMMY LINE)
                
            } // -2
            catch let error as NSError {  // +2.1
                print(error.description)
            } // -2.1
        } // -1
        
        
        
        */
        print(properties, myFileManager, myDocumentsFolder)  //DUMMY LINE
        
    }
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func sample_loadFileArray(){
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
                }
            }
        } catch { }
    }
    
    
    func sample_getSavedImage(named: String) -> UIImage? {
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            let temp3 = URL(fileURLWithPath: dir.absoluteString)
            let temp2 = temp3.appendingPathComponent(named).path
            let temp = UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
            return temp
        }
        return nil
    }
}



