//
//  DailyViewController.swift
//  PeaceTime
//
//  Created by Blue Star on 11/28/19.
//  Copyright © 2019 Guillermo Olmedo. All rights reserved.
//

import UIKit

class DailyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "Daily View"
        self.setupNavigation()
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
}
