//
//  ConfirmYoutube.swift
//  bolin-time
//
//  Created by alexfung on 2014-12-29.
//  Copyright (c) 2014 Test. All rights reserved.
//

import UIKit
import CoreData

class ConfirmYoutubeViewController: UIViewController {
    @IBOutlet var playerView: YTPlayerView!
    var id: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        playerView.loadWithVideoId(id)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadID(videoId: String){
        id = videoId
    }

}