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
                self.tableView.reloadData()
            }
        }
    }
    
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
        return self.films.films.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "StoriesCell", for: indexPath as IndexPath) as! StoriesTableViewCell
        cell.descriptionLabel?.text = self.films.films[indexPath.row].overview
        cell.websiteLabel?.text = self.films.films[indexPath.row].title
        cell.timeLabel?.text = self.films.films[indexPath.row].releaseDate
        cell.posterImage?.downloaded(from: "https://image.tmdb.org/t/p/w500\(self.films.films[indexPath.row].posterPath)")
        return cell
    }
}

extension StoriesViewController: UIScrollViewDelegate {
    
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

