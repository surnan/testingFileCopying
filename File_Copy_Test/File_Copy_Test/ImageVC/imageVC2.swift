   //
//  ImageVC2.swift
//  File_Copy_Test
//
//  Created by admin on 8/2/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ImageVC2: ViewController {
    
    //MARK:- Variables passed in
//    var allImages = [UIImage]()
    var allImagePaths = [String]()
    
    //MARK: Indices to navigate arrays passed in
    let imageIndexMin = 0
    var currentIndex = 0
    var imageIndexMax: Int  {
        get {
            return allImagePaths.count - 1
        }
    }
    
    //MARK:- LOCAL Variables
    var currentImageView : UIImageView = {
//        let tempImageView = UIImageView()
//        tempImageView.image = #imageLiteral(resourceName: "my_template_options")
        
        let tempImageView = UIImageView(image: #imageLiteral(resourceName: "my_template_options"))
        tempImageView.translatesAutoresizingMaskIntoConstraints = false
        return tempImageView
    }()
    
    var mySwipeGesture : UISwipeGestureRecognizer!
    
    //MARK:- Gesture Recognizer
    func  setupGestures(){
        [UISwipeGestureRecognizerDirection.right,
         UISwipeGestureRecognizerDirection.left,
         UISwipeGestureRecognizerDirection.up,
         UISwipeGestureRecognizerDirection.down].forEach({ direction in
            mySwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
            mySwipeGesture.direction = direction
            self.view.addGestureRecognizer(mySwipeGesture)
         })
    }
    
    @objc func handleSwipe(sender: UISwipeGestureRecognizer){
        switch sender.direction {
        case .left:
            currentIndex = min(currentIndex + 1, imageIndexMax)
            currentImageView.image = convertPathToImage(path: allImagePaths[currentIndex])
        case .right:
            currentIndex = max(imageIndexMin, currentIndex - 1)
            currentImageView.image = convertPathToImage(path: allImagePaths[currentIndex])
        case .up: fallthrough
        case .down: fallthrough
        default: print("Swype not Right/Left")
        }
    }
    
    //MARK:- My Functions
    func convertPathToImage(path: String) -> UIImage {
        guard let tempImage = UIImage(named: path) else {return UIImage()}
        return tempImage
    }
    
    //MARK:- Default Functions
    override func viewDidLoad() {
        
        setupGestures()
        currentImageView.image = convertPathToImage(path: allImagePaths[currentIndex])
        
        [currentImageView].forEach{view.addSubview($0)}
        
        NSLayoutConstraint.activate([
            currentImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            currentImageView.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor),
            currentImageView.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor),
            currentImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            ])
        
//        print(allImages)  //To avoid warning when compiling
    }
}
