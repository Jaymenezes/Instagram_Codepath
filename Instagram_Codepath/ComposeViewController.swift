//
//  ComposeViewController.swift
//  
//
//  Created by user on 3/5/16.
//
//

import UIKit
import Parse

class ComposeViewController: UIViewController, UIImagePickerControllerDelegate, UITextViewDelegate, UINavigationControllerDelegate, UITabBarDelegate{

    @IBOutlet weak var composeImageView: UIImageView!
    
    @IBOutlet weak var addImageButton: UIButton!
    
    @IBOutlet weak var composeCaptionTextView: UITextView!
    
    let imagePicker = UIImagePickerController()
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        composeCaptionTextView.delegate = self
        
        composeCaptionTextView.text = "Say something about this..."
        composeCaptionTextView.textColor = UIColor.lightGrayColor()
        
        imagePicker.delegate = self

        
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
  
    
    @IBAction func addIMageTapped(sender: AnyObject) {
        let actionSheet = UIAlertController(title: "Upload Image", message: nil, preferredStyle: .ActionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .Default, handler: {action in
            self.showCamera()
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Album", style: .Default, handler: {action in
            self.showAlbum()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: {action in
      
            
        }))
              self.presentViewController(actionSheet, animated: true, completion: nil)
        
        
    }
    
    
    func showAlbum() {
        
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imagePicker.mediaTypes = UIImagePickerController.availableMediaTypesForSourceType(.PhotoLibrary)!
        imagePicker.allowsEditing = true
        
        self.presentViewController(imagePicker, animated: true, completion: nil)

    }
    
    
    func showCamera() {

        
        imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        imagePicker.mediaTypes = UIImagePickerController.availableMediaTypesForSourceType(.Camera)!
        imagePicker.allowsEditing = true
        
        self.presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        dismissViewControllerAnimated(true, completion: nil)
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            composeImageView.image = image
            
            
            let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
            
            // Do something with the images (based on your use case)
            composeImageView.image = editedImage
            
        }

        
    }
    

    
    
 
    
    
    @IBAction func onPostToProfile(sender: AnyObject) {
        UserData.postUserImage(composeImageView.image, withCaption: composeCaptionTextView.text) { (success: Bool, error: NSError?) -> Void in
            if success {
                print("Posted to Parse")
                self.composeImageView.image = nil
                self.composeCaptionTextView.text = ""

            }
            else {
                print("Can't post to parse")
            }

        }
        


    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        if composeCaptionTextView.textColor == UIColor.lightGrayColor() {
            composeCaptionTextView.text = nil
            composeCaptionTextView.textColor = UIColor.blackColor()

        }
    }
    func textViewShouldEndEditing(textView: UITextView) -> Bool {
        composeCaptionTextView.resignFirstResponder()
        return true
    }
    
    
    func resize(image: UIImage, newSize: CGSize) -> UIImage {
        let resizeImageView = UIImageView(frame: CGRectMake(0, 0, newSize.width, newSize.height))
        resizeImageView.contentMode = UIViewContentMode.ScaleAspectFill
        resizeImageView.image = image
        
        UIGraphicsBeginImageContext(resizeImageView.frame.size)
        resizeImageView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
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


