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
    
    var image: UIImage?
    var author: PFUser?
    var caption: String?
    var likesCount: Int?
    var commentsCount: Int?
    
    var cell: PhotoTableViewCell?
    
//    
//    init(object : PFObject) {
//        super .init()
//        
//        let newObject = object
//        
//        caption = newObject["caption"] as? String
//        likesCount = newObject["likesCount"] as? Int
//        commentsCount = newObject["commentsCount"] as? Int
//        
//        if let newImage = object.valueForKey("media")! as? PFFile {
//            
//            newImage.getDataInBackgroundWithBlock({ (imageData: NSData?, error: NSError?) -> Void in
//                if (error == nil) {
//                    print("Image data found.. saving UIImage")
//                    let image = UIImage(data: imageData!)
//                    print(image)
//                    self.image = image
//                    self.cell?.userPost = self;
//                    
//                    
//                    // NSNotificationCenter.defaultCenter().postNotificationName(imageDataSetNotification, object: nil)
//                } else {
//                    print("ERROR: could not get image \(error?.localizedDescription)")
//                }
//                }, progressBlock: { (int: Int32) -> Void in
//                    print("int yay!")
//            })
//        }
//        
//    }
    
    
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
  