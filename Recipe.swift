//
//  Recipe.swift
//  core-data-recipies
//
//  Created by Adrian Padua on 5/16/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Recipe: NSManagedObject {

// Insert code here to add functionality to your managed object subclass

    // convert an image to data
    func setRecipeImage(img: UIImage) {
        let data = UIImagePNGRepresentation(img)
        self.image = data
    }
    // convert data to UIImage
    func getRecipeImg() -> UIImage {
        let img = UIImage(data: self.image!)
        return img!
    }
    
}
