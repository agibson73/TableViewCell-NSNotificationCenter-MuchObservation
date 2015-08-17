
//
//  Created by Steven Gibson on 8/16/15.
//  Copyright (c) 2015 OakmontTech. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var dataArray = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()


        // for some reason this is broken or my constraints are not right but I am not fixing them
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableViewAutomaticDimension
        self.setUpArray()
        

    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
    /**
    We want our tableView to have two sections so Array of Arrays
    */
    // create an array for our TableView with some fake data
    
    func setUpArray(){
        var song1 = Song()
        song1.image = UIImage(named: "partyDog")
        song1.title = "Party Time With Animations"
        song1.details = "Much Testing Animations"
        song1.musicID = "Party Time With Animations"
    
        var song2 = Song()
        song2.image = UIImage(named: "muchDog")
        song2.title = "Design + Code Rocks"
        song2.details = "Such Support"
        song2.musicID = "Design + Code Rocks"
        
        var song3 = Song()
        song3.image = UIImage(named: "suchDog")
        song3.title = "Obervations"
        song3.details = "Fastest Learning"
        song3.musicID = "Obervations"
        
        var songAray = [song2,song1,song3]
        var secondAray = [song1]
        dataArray = [secondAray,songAray]
        
        self.tableView.reloadData()
        
    
      
        tableView.registerNib(UINib(nibName: "MusicTableViewCell", bundle: nil), forCellReuseIdentifier: "music")
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return dataArray.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return dataArray[section].count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("music", forIndexPath: indexPath) as! MusicTableViewCell
        var song = dataArray[indexPath.section][indexPath.row] as? Song
        cell.musicID = song!.musicID
        cell.titleLabel.text = song?.title
        cell.coverImageView?.image = song?.image
        cell.infoLabel.text = song?.details
    

        return cell
    }
    
    override func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! MusicTableViewCell
        
        cell.removeObservation()
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var song = dataArray[indexPath.section][indexPath.row] as! Song
       
        NSNotificationCenter.defaultCenter().postNotificationName(song.musicID , object: nil)
         tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 30))
        let labe = UILabel(frame: view.frame)
        labe.textAlignment = NSTextAlignment.Center
        if section == 0{
        labe.text = "SUCH POPULAR"
        }
        else
        {
            labe.text = "Search Results"
        }
        view.addSubview(labe)
        
        return view
    }
  

 }
