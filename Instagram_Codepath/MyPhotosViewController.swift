//
//  MyPhotosViewController.swift
//  Instagram_Codepath
//
//  Created by user on 3/4/16.
//  Copyright © 2016 Jean. All rights reserved.
//

import UIKit
import Parse

class MyPhotosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UINavigationBarDelegate {
    
    var refreshControl: UIRefreshControl!
    var userPosts: [PFObject]?
    
    

    @IBOutlet weak var tableVIew: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableVIew.rowHeight = UITableViewAutomaticDimension
//        tableVIew.estimatedRowHeight = 120
        
        tableVIew.dataSource = self
        tableVIew.delegate = self
        
        getData()
        self.tableVIew.reloadData()
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to Refresh")
        self.refreshControl.addTarget(self, action: "refresh", forControlEvents: UIControlEvents.ValueChanged)
        self.tableVIew.addSubview(refreshControl)
        

        // Do any additional setup after loading the view.
    }
    
    func getData() {
     
        let query = PFQuery(className: "UserData")
        query.orderByDescending("_created_at")
        query.limit = 20
        
        query.findObjectsInBackgroundWithBlock { (media: [PFObject]?, error: NSError?) -> Void in
            if media != nil {
                self.userPosts = media
                self.tableVIew.reloadData()
            } else {
                print(error?.localizedDescription)
            }
        }    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let userPosts = userPosts {
            return userPosts.count
        }
        else {
            return 0
        }
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableVIew.dequeueReusableCellWithIdentifier("PhotoCell", forIndexPath: indexPath) as! PhotoTableViewCell

        
        let media = userPosts![indexPath.row]
        cell.postedCaptionLabel.text = media["caption"] as? String
        let userImageFile = media["media"] as! PFFile
        userImageFile.getDataInBackgroundWithBlock {
            (imageData: NSData?, error: NSError?) -> Void in
            if error == nil {
                if let imageData = imageData {
                    let image = UIImage(data:imageData)
                    cell.postedPhoto.image = image
                }
        
        
            }
        
        }
        return cell;
    }

    func refresh(sender: AnyObject) {
        let query = PFQuery(className: "UserMedia")
        query.orderByDescending("_created_at")
        query.limit = 20
        
        query.findObjectsInBackgroundWithBlock { (media: [PFObject]?, error: NSError?) -> Void in
            if media != nil {
                self.userPosts = media
                self.tableVIew.reloadData()
            } else {
                print(error?.localizedDescription)
            }
        }
    
    }

    @IBAction func onLogOut(sender: AnyObject) {
        
        PFUser.logOutInBackgroundWithBlock { (error: NSError?) -> Void in
            if error == nil {
                print("User logged out")
                self.performSegueWithIdentifier("logOutSegueID", sender: nil)
            }
            else {
                print("Error while logging out")
            }
            self.refreshControl.endRefreshing()
    
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
