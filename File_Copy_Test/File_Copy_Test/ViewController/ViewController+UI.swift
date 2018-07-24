//
//  ViewController+UI.swift
//  File_Copy_Test
//
//  Created by admin on 7/23/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

extension ViewController {
    func setupUI() {
        [openImagePickerButton, showImageSavedButton, savedImageView].forEach{view.addSubview($0)}
        
        NSLayoutConstraint.activate([
            openImagePickerButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            openImagePickerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            openImagePickerButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            
            showImageSavedButton.topAnchor.constraint(equalTo: openImagePickerButton.bottomAnchor, constant: 50),
            showImageSavedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showImageSavedButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            
            savedImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),
            savedImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),
            savedImageView.topAnchor.constraint(equalTo: showImageSavedButton.bottomAnchor, constant: 50),
            savedImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
    }
}
