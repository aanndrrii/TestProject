//
//  ViewController.swift
//  TestProject
//
//  Created by Andrii Voitenko on 13.10.2021.
//

import UIKit

struct Story {
    var description: String
    var website: String
    var time: String
}

class StoriesCell: UITableViewCell {
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
}

class StoriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    var tableData = [
        Story(description: "Mercedes Benz and Laures broadening their worldwide involvement", website: "Emersedesbenz.com", time: "1 hours ago"),
        Story(description: "Mercedes Benz and Laures broadening their worldwide involvement", website: "Emersedesbenz.com", time: "2 hours ago"),
        Story(description: "Mercedes Benz and Laures broadening their worldwide involvement", website: "Emersedesbenz.com", time: "3 hours ago"),
        Story(description: "Mercedes Benz and Laures broadening their worldwide involvement", website: "Emersedesbenz.com", time: "4 hours ago"),
        Story(description: "Mercedes Benz and Laures broadening their worldwide involvement", website: "Emersedesbenz.com", time: "5 hours ago")
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        scrollView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoriesCell", for: indexPath as IndexPath) as! StoriesCell
        cell.descriptionLabel?.text = tableData[indexPath.row].description
        cell.descriptionLabel?.lineBreakMode = .byWordWrapping
        cell.descriptionLabel?.numberOfLines = 0
        cell.websiteLabel?.textColor = UIColor.init(red: 40.0/255.0, green: 160.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        cell.websiteLabel?.text = tableData[indexPath.row].website
        cell.timeLabel?.text = tableData[indexPath.row].time

        return cell
    }
    
    
    
    
    

    


}

