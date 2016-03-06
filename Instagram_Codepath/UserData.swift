//
//  UserData.swift
//  Instagram_Codepath
//
//  Created by user on 3/5/16.
//  Copyright © 2016 Jean. All rights reserved.
//

import UIKit
import Parse


class UserData: NSObject {
    class func postUserImage(image: UIImage?, withCaption caption: String?, withCompletion completion: PFBooleanResultBlock){
        
    
    // Create Parse object PFObject
    let media = PFObject(className: "UserData")
    
    
    // Add relevant fields to the object
    media["media"] = getPFFileFromImage(image) // PFFile column type
    media["author"] = PFUser.currentUser() // Pointer column type that points to PFUser
    media["caption"] = caption
    media["likesCount"] = 0
    media["commentsCount"] = 0
    
    media.saveInBackgroundWithBlock(completion)
    print("posted succesfully")
}

    
    
    class func getPFFileFromImage(image: UIImage?) -> PFFile? {
        // check if image is not nil
        if let image = image {
            // get image data and check if that is not nil
            if let imageData = UIImagePNGRepresentation(image) {
                return PFFile(name: "image.png", data: imageData)
            }
        }
        return nil
    }
}
  