//
//  LoginViewController.swift
//  Instagram_Codepath
//
//  Created by user on 3/1/16.
//  Copyright © 2016 Jean. All rights reserved.
//

import UIKit
import Parse


class LoginViewController: UIViewController {

    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignIn(sender: AnyObject) {
        
        PFUser.logInWithUsernameInBackground(userNameField.text!, password: passwordField.text!)
            { (user: PFUser?, error: NSError?) -> Void in
        if user != nil {
            print("you're logged in")
            
                self.performSegueWithIdentifier("logInSegue", sender: nil)
            
        }else{
            print(error?.localizedDescription)
            
            let alertController = UIAlertController(title: error?.localizedDescription, message: "Username taken", preferredStyle: UIAlertControllerStyle.Alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            
            alertController.addAction(cancelAction)
            let OKAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(OKAction)
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }

    }
}
    
    
    @IBAction func onSignUp(sender: AnyObject) {
        
        let newUser = PFUser()
        newUser.username = userNameField.text
        newUser.password = passwordField.text
        
        newUser.signUpInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if success {
                print("created user")
                self.performSegueWithIdentifier("logInSegue", sender: nil)

                
            }else{
                print(error?.localizedDescription)
                
                let alertController = UIAlertController(title: error?.localizedDescription, message: "Username taken", preferredStyle: UIAlertControllerStyle.Alert)
                let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
                
                alertController.addAction(cancelAction)
                let OKAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                alertController.addAction(OKAction)
                self.presentViewController(alertController, animated: true, completion: nil)
                
//                self.presentingViewController(alertController, animated: true)
                
//                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
//                self.presentedViewController as! UIViewController (alertController, animated: true, completion: nil)
                //                self.presentedViewController(alertController, animated:true, completion: nil)
            
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
}