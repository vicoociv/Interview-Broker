//
//  NewViewController.swift
//  Interview Broker #3
//
//  Created by Victor Chien on 8/5/16.
//  Copyright © 2016 Victor Chien. All rights reserved.
//

import UIKit

class NewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var tableView2: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tabButton: UISegmentedControl!
    
    //key info from previous view
    var hospitalName: String!
    var availableDate: [(String, String)]!
    var waitlistDate: [(String, String)]!
    
    var dateList: [(String, String)]! //to be set to either one above depending on which one is selected. Default is available date list
    var selectedList = "available" //indicates whether waitlist or dateList was selected
    
    //for waitlist dates. So users can select multiple
    var selectionIndicator: [Bool]! = []
    
    let themeColor = UIColor(white: 1, alpha: 0.5)//UIColor(red: 197/225, green: 220/225, blue: 226/255, alpha: 1.0)
    
    //to be submitted to database/server
    var selectedTimes = [(String, String)]() //store this in a dictionary along with hospital name
    var selectedTimesDict = [String: (String,[(String, String)])]() //stores array above under hospital name

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateList = availableDate //default is set to available dates
        tabButton.layer.cornerRadius = 5
        self.titleLabel.text = self.hospitalName
        
        let background = CAGradientLayer().turquoiseLayer()
        background.frame = self.view.bounds
        self.view.layer.insertSublayer(background, atIndex: 0)
        
        self.tableView2.separatorStyle = UITableViewCellSeparatorStyle.None
        
        self.tableView2.reloadData()
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView2.dequeueReusableCellWithIdentifier("cell2", forIndexPath: indexPath) as! DatesTableViewCell
        
        cell.dateLabel.text = self.dateList[indexPath.row].0
        cell.timeLabel.text = self.dateList[indexPath.row].1
        cell.contentView.backgroundColor = UIColor.whiteColor()
        cell.accessoryType = .None
        
        selectionIndicator.append(false)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        let cellToSelect:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        let selected = selectionIndicator[indexPath.row]
        let tempDate = dateList[indexPath.row].0
        let tempTime = dateList[indexPath.row].1
        
        if selectedList == "waitlist"{ //allows for multiple selections
            if !selected{
                selectedTimes.append((tempDate, tempTime))
                selectionIndicator[indexPath.row] = true
                cellToSelect.accessoryType = .Checkmark
                cellToSelect.contentView.backgroundColor = themeColor
            }
            else{
                //delete deselected date/time
                selectedTimes = selectedTimes.filter() {!equal($0, tuple2: (tempDate, tempTime))}
                selectionIndicator[indexPath.row] = false
                cellToSelect.accessoryType = .None
                cellToSelect.contentView.backgroundColor = UIColor.whiteColor()
            }
        }
        else{
            selectedTimes.append((tempDate, tempTime))
            cellToSelect.accessoryType = .Checkmark
            cellToSelect.contentView.backgroundColor = themeColor
        }
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        if selectedList != "waitlist"{
            let cellToSelect:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
            cellToSelect.accessoryType = .None
            cellToSelect.contentView.backgroundColor = UIColor.whiteColor()
        
            let tempDate = dateList[indexPath.row].0
            let tempTime = dateList[indexPath.row].1
            selectedTimes = selectedTimes.filter() {!equal($0, tuple2: (tempDate, tempTime))}
        }
    }
    
    @IBAction func listChange(sender: AnyObject) {
        if tabButton.selectedSegmentIndex == 0{
            dateList = availableDate
            selectedList = "available"
        }
        else if tabButton.selectedSegmentIndex == 1{
            dateList = waitlistDate
            selectedList = "waitlist"
        }
        
        //clears all arrays
        selectedTimes.removeAll()
        selectionIndicator.removeAll()
        self.tableView2.reloadData()
    }
    
    @IBAction func submitClick(sender: UIBarButtonItem) { //stores date/times array in hopital dictionary
        if let name = titleLabel.text{
            selectedTimesDict[name] = (selectedList,selectedTimes)
        }
        
        //demo purposes
        print(hospitalName)
        print(selectedList)
        for (date, time) in selectedTimes{
            print("\(date) \(time)")
        }
        print(" ")
    }
    
    func equal <T:Equatable> (tuple1:(T,T),tuple2:(T,T)) -> Bool //for comparing the (Date, Time) tuples above
    {
        return (tuple1.0 == tuple2.0) && (tuple1.1 == tuple2.1)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dateList.count
    }
}
