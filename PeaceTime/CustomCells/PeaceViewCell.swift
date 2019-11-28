//
//  PeaceViewCell.swift
//  PeaceTime
//
//  Created by Blue Star on 11/29/19.
//  Copyright © 2019 Guillermo Olmedo. All rights reserved.
//

import UIKit

class PeaceViewCell: UICollectionViewCell {

    @IBOutlet weak var peaceTitle: UILabel!
    var dropDown: DropDownMenu!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    func configure(with value: String) {
        peaceTitle.text = value
        
        dropDown = DropDownMenu(frame: CGRect(x: 0, y: 32, width: contentView.bounds.width, height: 30))
        dropDown.placeholder = "Select your thought"
        dropDown.textColor = UIColor.lightGray
        dropDown.tint = UIColor.black
        dropDown.cornerRadius = 5
        dropDown.borderWidth = 0
        dropDown.options = ["Low", "Medium", "High"]
        dropDown.didSelect { (option, index) in
            
        }
        self.contentView.addSubview(dropDown)
    }
}
