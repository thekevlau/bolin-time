//
//  ViewController.swift
//  bolin-time
//
//  Created by alexfung on 2014-11-10.
//  Copyright (c) 2014 Test. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet var playerView: YTPlayerView!
    @IBOutlet var datePicker: UIDatePicker!
    
    lazy var managedObjectContext : NSManagedObjectContext? = {
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        return appDelegate.managedObjectContext
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        playerView.loadWithVideoId("GXEGMus7W_8")
    }

    @IBAction func works(sender: AnyObject) {
        println("it works!")
        var date = datePicker.date
        println("\(date)")
        println("It works!")
        var now = NSDate()
        println("\(now)")
        var interval = date.timeIntervalSinceDate(now)
        println("\(interval)")
        NSTimer.scheduledTimerWithTimeInterval(interval, target: self, selector: Selector("timerDidFire"), userInfo: nil, repeats: false)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func timerDidFire(){
        println("Fire!")
        playerView.playVideo()
    }

}

