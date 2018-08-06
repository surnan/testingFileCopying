//
//  ImageVC.swift
//  File_Copy_Test
//
//  Created by admin on 8/2/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ImageVC: ViewController {
    var myImageView: UIImageView?
    var finalImage: UIImage?
    
    var allImages = [UIImage]()
    
    var imageStackView : UIStackView = {
        var tempStackView = UIStackView()
        tempStackView.axis = .horizontal
        tempStackView.spacing = 20
        tempStackView.translatesAutoresizingMaskIntoConstraints = false
        return tempStackView
    }()
    
    var myScrollView: UIScrollView = {
        var tempScrollView = UIScrollView()
        tempScrollView.backgroundColor = UIColor.red
        tempScrollView.isDirectionalLockEnabled = true
        tempScrollView.bounces = false
        tempScrollView.isUserInteractionEnabled = true
        tempScrollView.translatesAutoresizingMaskIntoConstraints = false
        return tempScrollView
    }()
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    func buildImageStack(){
        for eachImage in allImages {
            print("ADDING IMAGE TO IMAGESTACK()")
            let tempImageView = UIImageView()
            tempImageView.isUserInteractionEnabled = true
            tempImageView.image = eachImage

            tempImageView.contentMode = .scaleAspectFit
            
            tempImageView.heightAnchor.constraint(equalToConstant: 500).isActive = true
//            tempImageView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
            
            
            imageStackView.addArrangedSubview(tempImageView)
        }
        myScrollView.addSubview(imageStackView)
    }
    
               
    override func viewDidLoad() {
        [myScrollView].forEach{view.addSubview($0)}
        buildImageStack()
        
        NSLayoutConstraint.activate([
            myScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            myScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            myScrollView.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor),
            myScrollView.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor),
            
            imageStackView.topAnchor.constraint(equalTo: myScrollView.topAnchor),
            imageStackView.bottomAnchor.constraint(equalTo: myScrollView.bottomAnchor),
            imageStackView.leadingAnchor.constraint(equalTo: myScrollView.leadingAnchor),
            imageStackView.trailingAnchor.constraint(equalTo: myScrollView.trailingAnchor),
            //imageStackView.widthAnchor.constraint(equalTo: view.widthAnchor )
            ])
    }
}
