//
//  ViewController.swift
//  bolin-time
//
//  Created by alexfung on 2014-11-10.
//  Copyright (c) 2014 Test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var playerView: YTPlayerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        playerView.loadWithVideoId("M7lc1UVf-VE")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

