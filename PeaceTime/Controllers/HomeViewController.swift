//
//  HomeViewController.swift
//  PeaceTime
//
//  Created by Blue Star on 11/28/19.
//  Copyright © 2019 Guillermo Olmedo. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var contentTableView: UITableView!
    var contentData = [ContentModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "Peace Time"
        self.registerTableViewCells()
        self.contentData = DataModel.shared.getContentData()
    }
    
    func registerTableViewCells() {
        self.contentTableView.delegate = self
        self.contentTableView.dataSource = self
        
        let contentViewCell = UINib(nibName: "ContentTableViewCell", bundle: nil)
        self.contentTableView.register(contentViewCell, forCellReuseIdentifier: "contentCell")
    }
    
    // MARK: - UITableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contentCell") as! ContentTableViewCell
        cell.configure(with: contentData[indexPath.row])
        
        return cell
    }
}
