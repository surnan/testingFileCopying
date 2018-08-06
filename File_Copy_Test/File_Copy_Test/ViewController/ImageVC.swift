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

    override func viewDidLoad() {


        
        guard let myImage = myImageView else {
            print("================")
            print("====TROUBLE=====")
            print("================")
            return
        }

        myImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(myImage)

        myImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        myImage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        myImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        myImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true

        
    }
}
