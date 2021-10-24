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

class StoriesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollImage: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var films: Films = Films() {
        didSet {
            DispatchQueue.main.async {
                
            }
        }
    }
    
    var tableData = [
        Story(description: "Mercedes Benz and Laures broadening their worldwide involvement,", website: "Emersedesbenz.com", time: "1 hour ago"),
        Story(description: "Mercedes Benz and Laures broadening their worldwide involvement", website: "Emersedesbenz.com", time: "2 hours ago"),
        Story(description: "Mercedes Benz and Laures broadening their worldwide involvement", website: "Emersedesbenz.com", time: "3 hours ago"),
        Story(description: "Mercedes Benz and Laures broadening their worldwide involvement", website: "Emersedesbenz.com", time: "4 hours ago"),
        Story(description: "Mercedes Benz and Laures broadening their worldwide involvement", website: "Emersedesbenz.com", time: "5 hours ago")
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "StoriesTableViewCell", bundle: nil), forCellReuseIdentifier: "StoriesCell")
        self.scrollView.delegate = self
        
        let filmRequest = FilmRequest()
        filmRequest.getFilms { result in
            switch result {
                case .failure(let error):
                   print(error)
                    
                case .success(let films):
                    self.films = films
                    
            }
        }
        
    }
    
}

extension StoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "StoriesCell", for: indexPath as IndexPath) as! StoriesTableViewCell
        cell.descriptionLabel?.text = self.tableData[indexPath.row].description
        cell.websiteLabel?.text = self.tableData[indexPath.row].website
        cell.timeLabel?.text = self.tableData[indexPath.row].time
        return cell
    }
}

extension StoriesViewController: UIScrollViewDelegate {
    
}

