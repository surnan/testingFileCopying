//
//  imageVC3.swift
//  File_Copy_Test
//
//  Created by admin on 8/9/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ImageVC3: UIViewController {
    
    //MARK:- Variables set beforehand
    var allImagePaths = [String]()
    
    //MARK:- Local Variables
    private var scrollFullScreen: UIScrollView = {
        var tempScrollView = UIScrollView()
        tempScrollView.isDirectionalLockEnabled = true
        tempScrollView.backgroundColor = UIColor.black
        tempScrollView.translatesAutoresizingMaskIntoConstraints = false
        return tempScrollView
    }()
    
    private var stackFullScreen: UIStackView = {
        var tempStackView = UIStackView()
        tempStackView.alignment =  .center
        tempStackView.axis = .horizontal
        tempStackView.spacing = 10
        tempStackView.translatesAutoresizingMaskIntoConstraints = false
        return tempStackView
    }()
    
    
    //MARK:- My Functions
    private func getImageFromPath(currentPath: String)-> UIImage {
        guard let tempImage = UIImage(named: currentPath) else {
            print("This path does not lead to an image \nPATH = \(currentPath)")
            return #imageLiteral(resourceName: "my_template_options")
        }
        return tempImage
    }
    
    
    private func setupStackFullScreen(imagePaths: [String]){
        let indexMax = min(2, allImagePaths.count - 1)
        for index in 0...indexMax {
            let tempImage = getImageFromPath(currentPath: allImagePaths[index])
            let tempImageView = UIImageView(image: tempImage)
            tempImageView.contentMode = .scaleAspectFit
            tempImageView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
            tempImageView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
            stackFullScreen.addArrangedSubview(tempImageView)
        }
    }
    
    //MARK:- Default Swift Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStackFullScreen(imagePaths: allImagePaths)
        scrollFullScreen.addSubview(stackFullScreen)
        setupUI()
    }
    
    
    //MARk:- User Interface Constraints
    private func setupUI(){
        [scrollFullScreen].forEach{view.addSubview($0)}
        NSLayoutConstraint.activate([
            scrollFullScreen.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollFullScreen.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollFullScreen.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollFullScreen.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackFullScreen.topAnchor.constraint(equalTo: scrollFullScreen.topAnchor),
            stackFullScreen.bottomAnchor.constraint(equalTo: scrollFullScreen.bottomAnchor),
            stackFullScreen.leadingAnchor.constraint(equalTo: scrollFullScreen.leadingAnchor),
            stackFullScreen.trailingAnchor.constraint(equalTo: scrollFullScreen.trailingAnchor),
            stackFullScreen.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
    }
}
