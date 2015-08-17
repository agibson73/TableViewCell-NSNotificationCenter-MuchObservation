
//  Created by Steven Gibson on 8/16/15.
//  Copyright (c) 2015 OakmontTech. All rights reserved.
//

import UIKit

class MusicTableViewCell: UITableViewCell {

    @IBOutlet weak var circleView: CircleView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    var animating = false

    var musicID : String = "" {
        didSet {
            NSNotificationCenter.defaultCenter().addObserver(self, selector: "animateCircle", name: musicID, object: nil   )
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func animateCircle(){
        animating = true
        circleView.animateCircle(4, fromValue: 0, toValue: 1)
        
        
        
    }
    
   
    
    func removeObservation(){
        NSNotificationCenter.defaultCenter().removeObserver(self, name: musicID, object: nil)
    }
    
}
