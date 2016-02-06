//
//  WebPageViewController.swift
//  MeetMeUp
//
//  Created by Richard Martin on 2016-02-02.
//  Copyright © 2016 Richard Martin. All rights reserved.
//

import UIKit

class WebPageViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var webPageViewOutlet: UIWebView!
    
    var meetupEvent: Meetup!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let url = NSURL(string: meetupEvent.eventURL)
        
        let request = NSURLRequest(URL: url!)
        
        webPageViewOutlet.loadRequest(request)
    
    }

    
    
    
}
