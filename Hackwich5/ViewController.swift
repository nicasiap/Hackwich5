//
//  ViewController.swift
//  Hackwich5
//
//  Created by CM Student on 2/26/18.
//  Copyright © 2018 CM Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITabBarDelegate, UITableViewDataSource {
//table view data is incharge of content. Delegate or the one that is able to add or remove/ display
    
    @IBOutlet weak var tableView: UITableView!
    var studentsArray = ["one", "two", "three", "four", "five" ]
    // ^^^ how to create an array literal
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // set VC as delegate
        // self.tableView.datasource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentsArray.count
        //this will adjust according to the array, users are able to add/delete items without touching the code
    
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //set up cell to display items in numbersArray, DONT FORGET EXCLAMATION POINT!
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        let text = studentsArray[indexPath.row]
        cell.textLabel?.text = text
        return cell
  
    }


}

