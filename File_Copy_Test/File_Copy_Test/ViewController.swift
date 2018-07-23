//
//  ViewController.swift
//  File_Copy_Test
//
//  Created by admin on 7/22/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK:- --LOCAL VARIABLES--
    var myImagePicker : UIImagePickerController = {
        var tempPicker = UIImagePickerController()
        tempPicker.allowsEditing = true
        tempPicker.sourceType = .photoLibrary
        return tempPicker
    }()
    
    var openImagePickerButton: UIButton = {
        var tempButton = UIButton()
        tempButton.setTitle("Open Image Picker", for: .normal)
        tempButton.setTitleColor(UIColor.white, for: .normal)
        tempButton.backgroundColor = UIColor.black
        tempButton.translatesAutoresizingMaskIntoConstraints = false
        return tempButton
    }()
    
    
    var showImageSavedButton: UIButton = {
        var tempButton = UIButton()
        tempButton.setTitle("Show Image", for: .normal)
        tempButton.setTitleColor(UIColor.white, for: .normal)
        tempButton.backgroundColor = UIColor.black
        tempButton.translatesAutoresizingMaskIntoConstraints = false
        return tempButton
    }()
    
    var savedImageView: UIView = {
        var tempView = UIView()
        tempView.backgroundColor = UIColor.yellow
        tempView.translatesAutoresizingMaskIntoConstraints = false
        return tempView
    }()
    
    
    
    //MARK:- --MY FUNCTION--
    //MARK: Document Objects
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func fileCopy(){
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
    } //func fileCopy()
    
    
    //MARK: Ui Stuff
    @objc func handleOpenImagePickerButton(){
        present(myImagePicker, animated: true)
    }
    
    @objc func handleShowImageSavedButton(){
        present(myImagePicker, animated: true)
    }
    
    func setupUI() {
        [openImagePickerButton, showImageSavedButton, savedImageView].forEach{view.addSubview($0)}
        
        NSLayoutConstraint.activate([
            openImagePickerButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            openImagePickerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            openImagePickerButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            
            showImageSavedButton.topAnchor.constraint(equalTo: openImagePickerButton.bottomAnchor, constant: 50),
            showImageSavedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showImageSavedButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            
            savedImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            savedImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            savedImageView.topAnchor.constraint(equalTo: showImageSavedButton.bottomAnchor, constant: 50),
            savedImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
        openImagePickerButton.addTarget(self, action: #selector(handleOpenImagePickerButton), for: .touchDown)
        showImageSavedButton.addTarget(self, action: #selector(handleShowImageSavedButton), for: .touchDown)
        
        setupUI()
        //        fileCopy()
        
        
        
    }
}

