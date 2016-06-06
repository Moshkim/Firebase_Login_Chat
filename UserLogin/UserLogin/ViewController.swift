//
//  ViewController.swift
//  UserLogin
//
//  Created by KWANIL KIM on 6/5/16.
//  Copyright © 2016 MoMo. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

  @IBOutlet weak var Username: UITextField!
  @IBOutlet weak var Password: UITextField!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  @IBAction func CreateAccount(sender: AnyObject) {
    
    FIRAuth.auth()?.createUserWithEmail(Username.text!, password: Password.text!, completion: {
        user, error in
      
      if error != nil{
        self.login()
      }
      else {
        print("User Created!!!")
        self.login()
      
      }
    })
    
    
  }
  
  func login() {
    FIRAuth.auth()?.signInWithEmail(Username.text!, password: Password.text!, completion: {
        user, error in
      if error != nil {
        print("Incorrect Password!")
      }
      else {
        print("I don't know what is going on!!")
      }
    
    })
  
  }


}

