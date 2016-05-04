//
//  ViewController.swift
//  HitList
//
//  Created by Lev on 5/4/16.
//  Copyright © 2016 Lev. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    // MARK: Properties
    
    let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    
    @IBAction func LoadBtn(sender: UIButton) {
        let request = NSFetchRequest(entityName: "User")
        request.returnsObjectsAsFaults = false
        
        do {
            let users = try context.executeFetchRequest(request) as! [User]
            
            if users.count > 0 {
                usernameText.text = users[0].username
                passwordText.text = users[0].password
            }
            else {
                print("No user found")
            }
        }
        catch {
            print("some error on fetching users")
        }
        
    }
    
    @IBAction func saveBtn(sender: UIButton) {
        let newUser = NSEntityDescription.insertNewObjectForEntityForName("User", inManagedObjectContext: context) as! User
        
        newUser.setValue(usernameText.text, forKey: "username")
        newUser.setValue(passwordText.text, forKey: "password")
        
        do {
            try context.save()
            print(newUser)
        }
        catch {
            print("some error")
        }
        
    }

    
}

