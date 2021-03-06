//
//  ViewController+Variables.swift
//  File_Copy_Test
//
//  Created by admin on 7/23/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    //MARK:- --PRIOR SET VARIABLES--
    var taskFolder: String?
    
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
    
    var savedImageView: UIImageView = {
        var tempView = UIImageView()
        tempView.backgroundColor = UIColor.yellow
        tempView.isHidden = true
        tempView.translatesAutoresizingMaskIntoConstraints = false
        return tempView
    }()
    
    var fileImageArray = [UIImage]()
    var fileImageUNCStringArray = [String]()
}
