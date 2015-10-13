//
//  SecondVC.swift
//  ToDo List App
//
//  Created by Adam Sebti on 12/10/15.
//  Copyright © 2015 Adam Sebti. All rights reserved.
//
import UIKit


class SecondVC: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var donebutton: UIButton!
    var delegate: vcDelegate?

    @IBOutlet weak var namefield: UITextField!

    
    var data: NSMutableArray!
    override func viewDidLoad() {
        print(data)
        super.viewDidLoad()
        donebutton!.addTarget(self, action: "done", forControlEvents: .TouchUpInside)
        namefield.delegate = self;
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func done(){
        data.addObject(self.namefield.text!)
        delegate?.updateModel(self.data)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            let nav = segue.destinationViewController as! ViewController
            nav.tasks = self.data
   
    }
    

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.
        namefield.resignFirstResponder()
        return true
    }


}