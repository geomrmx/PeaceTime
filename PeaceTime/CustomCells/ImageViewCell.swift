//
//  ImageViewCell.swift
//  PeaceTime
//
//  Created by Blue Star on 11/29/19.
//  Copyright © 2019 Guillermo Olmedo. All rights reserved.
//

import UIKit

class ImageViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func configure(with model: ImageCellModel) {
        titleLabel.text = model.title
        imageView.image = UIImage(named: model.imageName)
    }
}
