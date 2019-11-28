//
//  ContentTableViewCell.swift
//  PeaceTime
//
//  Created by Blue Star on 11/29/19.
//  Copyright © 2019 Guillermo Olmedo. All rights reserved.
//

import UIKit

class ContentTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var thumbNailView: UICollectionView!
    
    private var imageData = [ImageCellModel]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        self.thumbNailView.delegate = self
        self.thumbNailView.dataSource = self
        self.thumbNailView.register(UINib.init(nibName: "ImageViewCell", bundle: nil), forCellWithReuseIdentifier: "imageCell")
        
        // Setup collection view
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 240, height: 150)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16
        thumbNailView.setCollectionViewLayout(layout, animated: false)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configure(with model: ContentModel) {
        titleLabel.text = model.category
        self.imageData = model.content
        self.thumbNailView.reloadData()
    }
    
    // MARK: - UICollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath as IndexPath) as! ImageViewCell
        cell.configure(with: imageData[indexPath.row])
        
        return cell
    }
    
}
