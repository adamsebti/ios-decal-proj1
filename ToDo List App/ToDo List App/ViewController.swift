//
//  ViewController.swift
//  ToDo List App
//
//  Created by Adam Sebti on 11/10/15.
//  Copyright © 2015 Adam Sebti. All rights reserved.
//

import UIKit

protocol vcDelegate{
    
    func updateModel(arr: NSMutableArray!)
}
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, vcDelegate {
    
    var tasks: NSMutableArray! = NSMutableArray()
    

    @IBOutlet weak var tableview: UITableView!

    @IBOutlet weak var testbutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.reloadData()
        

        // Do any additional setup after loading the view, typically from a nib.
    }
    


    func updateModel(arr: NSMutableArray!) {
        self.tasks = arr
        tableview.reloadData()


    }
    
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell? = self.tableview.dequeueReusableCellWithIdentifier("cell") as UITableViewCell?
        cell!.textLabel?.text = self.tasks.objectAtIndex(indexPath.row) as? String
        return cell!
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.destinationViewController is SecondVC){
            let nav = segue.destinationViewController as! SecondVC
            nav.delegate = self
            nav.data = self.tasks
        }
        if(segue.destinationViewController is ThirdVC){
            let nav = segue.destinationViewController as! ThirdVC
            nav.numtasks = self.tasks.count
            nav.data = self.tasks
        }
        
    }


}

