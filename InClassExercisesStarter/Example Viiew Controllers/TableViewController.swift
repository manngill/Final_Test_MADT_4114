//
//  TableViewController.swift
//  InClassExercisesStarter
//
//  Created by parrot on 2018-11-21.
//  Copyright © 2018 room1. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    //1. Create your row items
    var items = ["Spiderman", "Batman"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Table view controller has loaded.")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // 2. Tell IOS how many sections you want
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        // 3. Tell IOS how many rows you need
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        print(items[indexPath.row])
        // 4. Change the text on the table cell
        cell.textLabel?.text = items[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let i = indexPath.row
        
        if (i == 0) {
            print("Going to the PINK page")
            performSegue(withIdentifier: "segueA", sender: self)
        }
        else if (i == 1) {
            print("Going to the YELLOW page")
            performSegue(withIdentifier: "segueB", sender: self)
        }
    
    }
    

}
