//
//  Meetup.swift
//  MeetMeUp
//
//  Created by Richard Martin on 2016-02-01.
//  Copyright © 2016 Richard Martin. All rights reserved.
//

import Foundation

class Meetup {
    var eventName: String         
    var eventAddress: String
    var rsvpCount: Int
    var hostingGroup: String
    var eventDescription: String
    var eventURL: String
    

    init(meetupDictionary: NSDictionary ) {
        let venueDictionary = meetupDictionary["venue"]
        let groupDictionary = meetupDictionary["group"]
        
        eventName = meetupDictionary["name"] as! String
        eventAddress = venueDictionary!["address_1"] as! String
        rsvpCount = meetupDictionary["yes_rsvp_count"] as! Int
        hostingGroup = groupDictionary!["name"] as! String
        eventDescription = meetupDictionary["description"] as! String
        eventURL = meetupDictionary["event_url"] as! String
        
    }
}
