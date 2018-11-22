//
//  SeeReservationsViewController.swift
//  InClassExercisesStarter
//
//  Created by parrot on 2018-11-22.
//  Copyright © 2018 room1. All rights reserved.
//

import UIKit
import FirebaseFirestore

class SeeReservationsViewController: UIViewController {

    
    //MARK: Outlets
    @IBOutlet weak var textField: UITextView!
    
    
    // MARK: Firebase variables
    var db:Firestore!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("You are on the see reservations screen")
        
        db = Firestore.firestore()
        
        let settings = db.settings
        settings.areTimestampsInSnapshotsEnabled = true
        db.settings = settings
        
        db.collection("reservations").getDocuments() {
            
            (x, error) in
            
            
            
            if (x == nil) {
                
                print("Error fetching document: \(error!)")
                
                return
                
            }
            
            
            
            x?.documentChanges.forEach({
                
                (diff) in
                
                
                
                if (diff.type == DocumentChangeType.added) {
                    
                    // something was added
                    
                    let data = diff.document.data()     // get the document that was added
                    
                    let name = data["Name"] as! String
                    
                    let day = data["Day"] as! String
                    
                    let seats = data["Seats available"] as!
                    
                    print(name);
                    
                    print(day);
                    
                    print(seats);
                    
                    
                    
                    self.showDatabase.text = self.showDatabase.text + "\n Name: \(name) \n Day: \(day) \n   total number of seats: \(seats) \n-----------\n"
                    
                }
                
            })
            
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
