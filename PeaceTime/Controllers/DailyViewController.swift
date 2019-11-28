//
//  DailyViewController.swift
//  PeaceTime
//
//  Created by Blue Star on 11/28/19.
//  Copyright © 2019 Guillermo Olmedo. All rights reserved.
//

import UIKit

class DailyViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource  {    

    @IBOutlet weak var peaceValueView: UICollectionView!
    var peaceData = ["Mood", "Comfort", "Stress Level", "Calm", "Thankful", "Clarity", "Grateful", "Self-awareness", "Did something good", "Did something bad", "Selflessness"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "Daily View"
        self.setupNavigation()
        
        self.peaceValueView.delegate = self
        self.peaceValueView.dataSource = self
        self.peaceValueView.register(UINib.init(nibName: "PeaceViewCell", bundle: nil), forCellWithReuseIdentifier: "peaceCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.registerViewCell()
    }
    
    private func registerViewCell() {
        
        // Setup collection view
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (view.bounds.width - 64) / 2, height: 150)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 32
        layout.minimumInteritemSpacing = 32
        peaceValueView.setCollectionViewLayout(layout, animated: false)
    }
    
    func setupNavigation() {
        // Change the back button style
        let backButton = UIBarButtonItem()
        backButton.title = "Home"
        backButton.tintColor = UIColor.black
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        // Add the right button item
        let infoButton = UIBarButtonItem(barButtonSystemItem: .compose,
                                         target: self,
                                         action: #selector(DailyViewController.inforButtonClicked))
        infoButton.tintColor = UIColor.black
        self.navigationItem.rightBarButtonItem = infoButton
    }
    
    @objc func inforButtonClicked() {
        let alertController = UIAlertController(title: "Daily View",
                                                message: "Enter your thoughts and how you feel.",
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action: UIAlertAction) in
            
        }
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
    }
    
    // MARK: - UICollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return peaceData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "peaceCell", for: indexPath as IndexPath) as! PeaceViewCell
        cell.configure(with: peaceData[indexPath.row])
        
        return cell
    }
}
