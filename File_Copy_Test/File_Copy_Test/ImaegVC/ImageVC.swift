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
        tempStackView.spacing = 0
        
        tempStackView.alignment = .center
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
    
    //MARK:- My Functions
    
    func buildImageStack(){
        for eachImage in allImages {
            let tempImageView = UIImageView(image: eachImage)
            let width = view.frame.width
            let height = view.frame.width
            tempImageView.widthAnchor.constraint(equalToConstant: width).isActive = true
            tempImageView.heightAnchor.constraint(equalToConstant: height).isActive = true
            imageStackView.addArrangedSubview(tempImageView)        
        }
        myScrollView.addSubview(imageStackView)
    }
    

    //MARK:- Default Functions
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
            imageStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
    }
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
