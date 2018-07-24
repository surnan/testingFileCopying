//
//  ViewController.swift
//  File_Copy_Test
//
//  Created by admin on 7/22/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK:- --MY FUNCTION--
    //MARK: Document Objects
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func makeFolderIfNecessary(){
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)  //[URL]
        let destPathString = documentsURL[0].appendingPathComponent("Media").path             //string
        //        let sourcePathUNC = documentsURL[0]                                         //URL
        //        let sourcePathString = documentsURL[0].path                                 //string
        //        let destPathUNC = documentsURL[0].appendingPathComponent("Media")           //URL
        
        do {
            try FileManager.default.createDirectory(atPath: destPathString, withIntermediateDirectories: false, attributes: nil)
            print("\nDIRECTORY 'Media' CREATED")
        } catch {
            return
        }
    } //func fileCopy()
    
    
    //MARK: Ui Stuff
    @objc func handleOpenImagePickerButton() {
        present(myImagePicker, animated: true)
    }
    
    @objc func handleShowImageSavedButton() {
        savedImageView.isHidden = false
    }
        
    //MARK:- Image Picker Controller
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let imageURL = info[UIImagePickerControllerImageURL] as! URL
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)  //[URL]
        let destPathUNC = documentsURL[0].appendingPathComponent("Media")           //URL
        //        let destPathString = documentsURL[0].appendingPathComponent("Media").path   //string
        
        let imageFileName = imageURL.lastPathComponent
        //        let finalDestUNC = destPathUNC.appendingPathComponent("3E59691E-831F-4A3F-B3B6-4BD1909019BE.png") //fileName
        let finalDestUNC = destPathUNC.appendingPathComponent(imageFileName) //fileName
        
        do {
            try FileManager.default.copyItem(atPath: imageURL.path, toPath: finalDestUNC.path)
            print("!!!!!!DID A COPY !!!!!!")
        } catch let saveERR {
            print("FAIL --> \(saveERR)")
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    //MARK:- Built-in Swift Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
        
        myImagePicker.delegate = self
        openImagePickerButton.addTarget(self, action: #selector(handleOpenImagePickerButton), for: .touchDown)
        showImageSavedButton.addTarget(self, action: #selector(handleShowImageSavedButton), for: .touchDown)
        
        makeFolderIfNecessary()
        setupUI()
    }
}

