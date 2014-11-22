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
    @IBOutlet var linkField: UITextField!
    
    lazy var managedObjectContext : NSManagedObjectContext? = {
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        return appDelegate.managedObjectContext
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func works(sender: AnyObject) {
        let link = NSURL(string: linkField.text)
        if(!verifyYoutubeLink(link)){
            alertInvalidLink()
            return
        }
        
        playerView.loadWithVideoId(extractIdFromLink(link))
        
        var date = datePicker.date
        var now = NSDate()
        var interval = date.timeIntervalSinceDate(now)
        NSTimer.scheduledTimerWithTimeInterval(interval, target: self, selector: Selector("timerDidFire"), userInfo: nil, repeats: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func verifyYoutubeLink(link: NSURL?) -> Bool{
        if(link == nil){
            return false
        }
        
        let host = link!.host
        println(host)
        
        return (host! == "youtube.com" || host! == "www.youtube.com")
    }
    
    func extractIdFromLink(link: NSURL?) -> String{
        
        let query = link!.query
        let NSQuery: NSString = query!
        let arrayOfQueries: NSArray = NSQuery.componentsSeparatedByString("&")
        
        for query in arrayOfQueries{
            let arrayOfQuery: NSArray = query.componentsSeparatedByString("=")
            if(arrayOfQuery[0] as String == "v"){
                return arrayOfQuery[1] as String
            }
        }
        
        return ""
    }
    
    func alertInvalidLink(){
        var alert = UIAlertController(title: "Invalid Link", message: "Please enter a youtube link", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func timerDidFire(){
        println("Fire!")
        playerView.playVideo()
    }

}

