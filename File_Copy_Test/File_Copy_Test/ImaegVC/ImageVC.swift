//
//  ImageVC.swift
//  File_Copy_Test
//
//  Created by admin on 8/2/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ImageVC: ViewController {
    
    //MARK:- Variables passed in
    var allImages = [UIImage]()
    var allImagePaths = [String]()
    
    
    //MARK:- Local Variables
    var imageStackView : UIStackView = {
        var tempStackView = UIStackView()
        tempStackView.axis = .horizontal
//        tempStackView.distribution = .fillProportionally
//        tempStackView.alignment = .center
        tempStackView.spacing = 0
        tempStackView.translatesAutoresizingMaskIntoConstraints = false
        return tempStackView
    }()
    
    var myScrollView: UIScrollView = {
        var tempScrollView = UIScrollView()
//        tempScrollView.isPagingEnabled = true
        tempScrollView.backgroundColor = UIColor.black
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
          
            let tempImageView = UIImageView(image: eachImage)
            
            let width = view.frame.width
            let height = view.frame.width
            
            tempImageView.widthAnchor.constraint(equalToConstant: width).isActive = true
            tempImageView.heightAnchor.constraint(equalToConstant: height).isActive = true
            
            
//            let tempImageView = UIImageView()
//            tempImageView.image = eachImage
//            tempImageView.contentMode = .scaleAspectFit
//            tempImageView.translatesAutoresizingMaskIntoConstraints = false
//            tempImageView.heightAnchor.constraint(equalToConstant: 500).isActive = true
            
            imageStackView.addArrangedSubview(tempImageView)        
        }
        myScrollView.addSubview(imageStackView)
    }
    
    
    override func viewDidLoad() {

        buildImageStack()
        [myScrollView].forEach{view.addSubview($0)}

        NSLayoutConstraint.activate([
            myScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            myScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            myScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            imageStackView.topAnchor.constraint(equalTo: myScrollView.topAnchor),
            imageStackView.bottomAnchor.constraint(equalTo: myScrollView.bottomAnchor),
            imageStackView.leadingAnchor.constraint(equalTo: myScrollView.leadingAnchor),
            imageStackView.trailingAnchor.constraint(equalTo: myScrollView.trailingAnchor),

            ])
    }
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
