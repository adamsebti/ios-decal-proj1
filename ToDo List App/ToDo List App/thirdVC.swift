//
//  thirdVC.swift
//  ToDo List App
//
//  Created by Adam Sebti on 12/10/15.
//  Copyright © 2015 Adam Sebti. All rights reserved.
//

import UIKit

class ThirdVC: UIViewController{
    
    @IBOutlet weak var tasknum: UILabel!
    var numtasks:Int = 0
    var data: NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tasknum.text = String(numtasks);
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nav = segue.destinationViewController as! ViewController
        nav.tasks = self.data
        
    }
}
