//
//  ViewController.swift
//  MeetMeUp
//
//  Created by Richard Martin on 2016-02-01.
//  Copyright © 2016 Richard Martin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    @IBOutlet weak var meetupTableView: UITableView!
    
    var meetups = [NSDictionary]()
    var meetupObjects = [Meetup]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "https://api.meetup.com/2/open_events.json?zip=60604&text=mobile&time=,1w&key=477d1928246a4e162252547b766d3c6d")
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithURL(url!) { (data, response, error) -> Void in
            do{
                let meetupEvent = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as! NSDictionary
                
                self.meetups = meetupEvent.objectForKey("results") as! [NSDictionary]
                
                for dict: NSDictionary in self.meetups {
                    let meetupObject: Meetup = Meetup(meetupDictionary: dict)
                    self.meetupObjects.append(meetupObject)
                }
                
            }
            catch let error as NSError{
                print("JSON Error: \(error.localizedDescription)")
            }
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.meetupTableView.reloadData()
            })
        }
        task.resume()
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return meetups.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CellID")!
        let meetup = meetupObjects[indexPath.row]
        
        cell.textLabel?.text = meetup.eventName
        cell.detailTextLabel!.text = meetup.eventAddress
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let dvc = segue.destinationViewController as! EventDetailViewController
        
        dvc.meetupEvent = meetupObjects[(meetupTableView.indexPathForSelectedRow?.row)!]
        
    }

}

