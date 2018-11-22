//
//  LoginViewController.swift
//  InClassExercisesStarter
//
//  Created by parrot on 2018-11-22.
//  Copyright © 2018 room1. All rights reserved.
//
import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    var email = ""
    var password = ""
    @IBOutlet weak var txtMessage: UILabel!
    
    @IBAction func btnLogin(_ sender: Any) {
        email = txtEmail.text!
        password  = txtPassword.text!
        
        Auth.auth().signIn(withEmail: email, password: password) {
            
            (user, error) in
            
            if (user != nil) {
                // 1. Found a user!
                print("User signed in! ")
                print("User id: \(user?.user.uid)")
                print("Email: \(user?.user.email)")
                
                var id = user?.user.email
                
                let userDefaults = UserDefaults.standard
                userDefaults.setValue(id, forKey: "userId")
                userDefaults.synchronize()
                
                print("user id ", id)
                
                
                // 2. So send them to screen 2!
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else {
                // 1. A problem occured when looking up  the user
                // - doesn't meet password requirements
                // - user already exists
                print("ERROR!")
                print(error?.localizedDescription)
                
                self.txtMessage.text = error?.localizedDescription
                
                // 2. Show the error in user interface
                // self.statusMessageLabel.text = error?.localizedDescription
            }
        }
        
        
    }
    
    
    @IBAction func btnSignup(_ sender: Any) {
        email = txtEmail.text!
        password  = txtPassword.text!
        
        
        print("show message")
        
        Auth.auth().createUser(withEmail: email, password: password) {
            
            (user, error) in
            
            if (user != nil) {
                // 1. New user created!
                print("Created user: ")
                print("User id: \(user?.user.uid)")
                print("Email: \(user?.user.email)")
                
                self.txtMessage.text = "Account Created."
                
                
            }
            else {
                // 1. Error when creating a user
                print("ERROR!")
                print(error?.localizedDescription)
                
                // 2. Show the error in the UI
                self.txtMessage.text = error?.localizedDescription
                
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: Actions
    
    
    
    
    /*
     // MARK: - Navigation
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
