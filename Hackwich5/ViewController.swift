//
//  ViewController.swift
//  Hackwich5
//
//  Created by CM Student on 2/26/18.
//  Copyright © 2018 CM Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//table view data is incharge of content. Delegate or the one that is able to add or remove/ display
    
    @IBOutlet weak var tableView: UITableView!
    var restaurantsArray = ["Kalapawai", "two", "three", "four", "five" ]
    // ^^^ how to create an array literal
    
    
    
    
    
    //Restaurant Image Data
    var restaurantImageData = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        // set VC as delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        //part 6
        let path = Bundle.main.path(forResource: "Property List", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: path!)
        
        restaurantImageData = dict!.object(forKey:"restaurantImages") as! [String]
    }

   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    func numberOfSections(in tableView: UITableView) -> Int {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantsArray.count
        //this will adjust according to the array, users are able to add/delete items without touching the code
    
    }
   
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //set up cell to display items in numbersArray, DONT FORGET EXCLAMATION POINT!
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier", for: indexPath)
        let text = restaurantsArray[indexPath.row]
        cell.textLabel?.text = text
        return cell
  
    }
    
    //part 7
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue,sender: Any?) {
        if segue.identifier == "mySegue"
        {
            let s1 = segue.destination as! detailViewController
            let imageIndex = tableView.indexPathForSelectedRow?.row
            s1.imagePass = restaurantImageData[imageIndex!]
        }
    }

}

