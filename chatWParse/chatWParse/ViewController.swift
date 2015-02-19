//
//  ViewController.swift
//  chatWParse
//
//  Created by Anoop tomar on 2/18/15.
//  Copyright (c) 2015 devtechie.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

 
    @IBAction func onSignIn(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground(EmailTextField.text, password:PasswordTextField.text) {
            (user: PFUser!, error: NSError!) -> Void in
            if user != nil {
                println("logged in")
                self.performSegueWithIdentifier("chatSegue", sender: self)
            } else {
                var alert = UIAlertController(title: "Login Failed", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
                var okayButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                alert.addAction(okayButton)
                self.presentViewController(alert, animated: true, completion: nil)
             }
        }
    }
    
    
    @IBAction func onSignUp(sender: AnyObject) {
        var user = PFUser()
        user.username = EmailTextField.text
        user.password = PasswordTextField.text
        user.email = EmailTextField.text
        // other fields can be set just like with PFObject
        user["phone"] = "415-392-0202"
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool!, error: NSError!) -> Void in
            if error == nil {
                println("signed up")
            } else {
                //let errorString = (error.userInfo["error"]) as? NSString
                var alert = UIAlertController(title: "Signup Failed", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
                var okayButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                alert.addAction(okayButton)
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
    }
    
}

