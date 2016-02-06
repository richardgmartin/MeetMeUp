//
//  EventDetailViewController.swift
//  MeetMeUp
//
//  Created by Richard Martin on 2016-02-01.
//  Copyright © 2016 Richard Martin. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController {

    var meetupEvent: Meetup!
    
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventHostingGroupLabel: UILabel!
    @IBOutlet weak var eventRSVPLabel: UILabel!
    @IBOutlet weak var eventDescriptionLabel: UILabel!
    
    @IBOutlet weak var onWebVisitButtonPressed: UIButton!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.eventNameLabel.text = meetupEvent.eventName
        self.eventHostingGroupLabel.text = meetupEvent.hostingGroup
        self.eventDescriptionLabel.text = meetupEvent.eventDescription
        self.eventRSVPLabel.text = String(meetupEvent.rsvpCount)
        
    
    }

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let dvc = segue.destinationViewController as! WebPageViewController
        
        dvc.meetupEvent = self.meetupEvent
        
    }

}
