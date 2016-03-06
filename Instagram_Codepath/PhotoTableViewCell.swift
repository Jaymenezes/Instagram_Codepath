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
    @IBOutlet weak var postContentTextView: UITextView!
    
    
//    var object: PFObject? {
//        didSet {
//            photo = Photo(object: object!)
//            photo.cell = self;
//        }
//    }
//    
//    var photo: Photo! {
//        didSet {
//            postedPhoto.image = photo.image
//        }
//    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
