//
//  PhotoCell.swift
//  Instagram_Codepath
//
//  Created by user on 3/5/16.
//  Copyright © 2016 Jean. All rights reserved.
//

import UIKit
import Parse

class PhotoTableViewCell: UITableViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var postedPhoto: UIImageView!
    @IBOutlet weak var timeCreatedLabel: UILabel!
    @IBOutlet weak var postedCaptionLabel: UILabel!
    
//    var postsObject: PFObject? {
//        didSet {
//            userPost = UserPost(postObject: postsObject!)
//            userPost.cell = self;
//        }
//    }
//    
//    var userPost: UserPost! {
//        didSet {
//            postedPhoto.image = userPost.photo
//            print("This is the image that is to be set: \(userPost.photo))")
//            // this causes the nil crash!! so userPost.photo must be nil...
//            //            print("This is the image that is to be set: \((userPost.photo)!)")
//            
//            
//            if userPost.caption == postedCaptionLabel {
//                postedCaptionLabel.text = ""
//            } else {
//                postedCaptionLabel.text = userPost.caption
//            }
//            print("the caption is: \((postedCaptionLabel.text)!)")
//            
//            userNameLabel.text = userPost.author?.username
//            print("the user is: \((userNameLabel.text)!)")
//            print("")
//        }
//    }
//
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
