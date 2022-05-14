//
//  PhotoModel.swift
//  Navigation
//
//  Created by Alexander Kryuchkov on 14.05.2022.
//

import UIKit

struct PhotoModel {
    let image: String
    
    static func makePhotoModel() -> [PhotoModel] {
        var model = [PhotoModel]()
        
        for item in 0...19 {
            model.append(PhotoModel(image: "photo_\(item + 1)"))
        }
        
        return model
    }

}
