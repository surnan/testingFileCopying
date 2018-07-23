//
//  ViewController.swift
//  File_Copy_Test
//
//  Created by admin on 7/22/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK:- My local variables
    var myImagePicker : UIImagePickerController = {
       var tempPicker = UIImagePickerController()
        tempPicker.allowsEditing = true
        tempPicker.sourceType = .photoLibrary
        return tempPicker
    }()
    
    var openImagePickerButton: UIButton = {
       var tempButton = UIButton()
        tempButton.setTitle("Open Image Picker", for: .normal)
        tempButton.setTitleColor(UIColor.black, for: .normal)
        tempButton.backgroundColor = UIColor.lightGray
        tempButton.translatesAutoresizingMaskIntoConstraints = false
        return tempButton
    }()
    
    
    
    //MARK:- My functions
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
        
        let fileManager = FileManager.default
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)  //[URL]

        let sourcePathUNC = documentsURL[0]                 //URL
        let sourcePathString = documentsURL[0].path         //string

        let destPathUNC = documentsURL[0].appendingPathComponent("Media")           //URL
        let destPathString = documentsURL[0].appendingPathComponent("Media").path   //string

        
        do{
            try fileManager.createDirectory(atPath: destPathString, withIntermediateDirectories: false, attributes: nil)
            print("\nDIRECTORY 'Media' CREATED")
        } catch {
            print("did not create directory")
        }

        
        
        let finalSourceUNC = sourcePathUNC.appendingPathComponent("testFile.rtf")
        let finalDestUNC = destPathUNC.appendingPathComponent("testFile.rtf")
        
        
        
        do {
            try fileManager.copyItem(atPath: finalSourceUNC.path, toPath: finalDestUNC.path)
            print("!!!!!!DID A COPY !!!!!!")
        } catch let saveERR {
            print("FAIL --> \(saveERR)")
        }
        
        
        
        
        
//        print(fileManager, documentsURL, finalDatabaseURL, internalDocumentsURL)
        
        
        //        print("getDocumentsDirectory() -> \(getDocumentsDirectory())")
        //
        //        let folderPath = URL(fileURLWithPath: getDocumentsDirectory().absoluteString, isDirectory: true)
        //
        //        let newMTSFolder = folderPath.stringByAppendingPathComponent("MTS Files")
        //
        //        if (!fileManager.fileExistsAtPath(newMTSFolder)) {
        //            fileManager.createDirectoryAtPath(newMTSFolder, withIntermediateDirectories: false, attributes: nil, error: nil)
        //        }
    }
    
}

