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
    
    var images = [PFFile]()
    var mediaArray: [PFObject]?
    

    @IBOutlet weak var tableVIew: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableVIew.rowHeight = UITableViewAutomaticDimension
        tableVIew.estimatedRowHeight = 120
        
        tableVIew.dataSource = self
        tableVIew.delegate = self
        
        getData()
        self.tableVIew.reloadData()

        // Do any additional setup after loading the view.
    }
    
    func getData() {
     
        let query = PFQuery(className: "UserData")
        query.orderByDescending("_created_at")
        query.limit = 20
        
        query.findObjectsInBackgroundWithBlock { (media: [PFObject]?, error: NSError?) -> Void in
            if media != nil {
                self.mediaArray = media
                self.tableVIew.reloadData()
            } else {
                print(error?.localizedDescription)
            }
        }    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("rows being called")
        
        return images.count

    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableVIew.dequeueReusableCellWithIdentifier("PhotoCell", forIndexPath: indexPath) as! PhotoTableViewCell

        
        
        
        
        
        
        
        return cell;
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
