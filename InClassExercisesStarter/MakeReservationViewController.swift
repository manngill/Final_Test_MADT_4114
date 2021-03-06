//
//  MakeReservationViewController.swift
//  InClassExercisesStarter
//
//  Created by parrot on 2018-11-22.
//  Copyright © 2018 room1. All rights reserved.
//

import UIKit
import FirebaseFirestore


class MakeReservationViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var seatsTextField: UITextField!
    
    //@IBOutlet weak var lblResult: UILabel!
    // Mark: Firestore variables
    var db:Firestore!
    var abc = ""
    
    // MARK: Default Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        abc = UserDefaults.standard.string(forKey: "userId")!
        print(abc)
        db = Firestore.firestore()
        
        let settings = db.settings
        settings.areTimestampsInSnapshotsEnabled = true
        db.settings = settings
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: Actions
    @IBAction func buttonPressed(_ sender: Any) {
        print("pressed the button")
        
        let res = db.collection("reservations")
        
        
        
        
        res.document(abc + nameTextField.text! + dayTextField.text!).setData([
            "username": abc,
            "restaurant": nameTextField.text!,
            "day" : dayTextField.text!,
            "numSeats": seatsTextField.text!
            ])
        
        // lblResult.text = "Reservation Successfull.  Go back and see the reservations menu"
        
        
    }
    
    
    
    
    /*
     // MARK: - Navigation
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
