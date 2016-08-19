//
//  ViewController.swift
//  Interview Broker #3
//
//  Created by Victor Chien on 8/5/16.
//  Copyright © 2016 Victor Chien. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    private var hospitalNames = ["Hospital One", "Hospital Two", "Hospital Three", "Hospital Four"] //demo data
    
    private var dateList: [[(String, String)]] = [[("Aug 1", "am"),("Aug 1", "pm"),("Aug 23", "am"),("Aug 23", "pm"),("Sept 20", "am"),("Sept 22", "am")],[("Oct 2", "am"),("Oct 2", "pm"),("Oct 5", "am")], [("Oct 12", "am"),("Oct 12", "pm"),("Oct 23", "pm"),("Dec 23", "am")], [("Jan 1", "am"),("Jan 1", "pm"),("Jan 2", "am"),("Jan 2", "pm"),("Jan 4", "pm")]] //demo data
    
    private var waitlist: [[(String, String)]] = [[("Aug 2", "am"),("Aug 2", "pm"),("Aug 21", "am"),("Sept 22", "am")],[("Oct 3", "pm"),("Oct 5", "pm")], [("Oct 14", "am"),("Oct 14", "pm"),("Oct 25", "pm"),("Dec 24", "pm")], [("Jan 3", "am"),("Jan 3", "pm"),("Jan 6", "am"),("Jan 6", "pm"),("Jan 14", "am")]] //demo data

    
    
    //make dicionary with am and pm as first item and array of available dates as second.
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let background = CAGradientLayer().turquoiseLayer()
        background.frame = self.view.bounds
        self.view.layer.insertSublayer(background, atIndex: 0)
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.hospitalNames.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomTableViewCell
        
        cell.titleLabel.text = self.hospitalNames[indexPath.row] //sets the hospital name for each row
        cell.availableCount.text = "\(self.dateList[indexPath.row].count)" //sets the availability count for each row
        cell.hospitalPic.image = UIImage(named: self.hospitalNames[indexPath.row]) //adds hospital logo
        
        //account for unknown hospitals logos as well
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        self.performSegueWithIdentifier("showView", sender: self)
    }
    
    @IBAction func logAction(sender: UIButton){
        let titleString = self.hospitalNames[sender.tag]
        let firstActivityItem = "\(titleString)"
        let activityViewController: UIActivityViewController = UIActivityViewController(activityItems: [firstActivityItem], applicationActivities: nil)
        
        self.presentViewController(activityViewController, animated: true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showView"){
            let upcoming: NewViewController = segue.destinationViewController as! NewViewController
            
            if let tempIndex = tableView.indexPathForSelectedRow{
                let cellIndex = tempIndex.row
                
                //passing info to second view controller
                if hospitalNames.count > 0 && dateList.count > 0{
                    upcoming.hospitalName = self.hospitalNames[cellIndex]//passing name of hospital
                    upcoming.availableDate = self.dateList[cellIndex]//passing array of dates
                    upcoming.waitlistDate = self.waitlist[cellIndex]//passing array of waitlist dates
                }
            }
        }
    }
}

