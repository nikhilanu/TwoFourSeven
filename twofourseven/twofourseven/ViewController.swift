//
//  ViewController.swift
//  twofourseven
//
//  Created by Nikhil Anu on 5/27/19.
//  Copyright © 2019 Nikhil Anu. All rights reserved.
//

import UIKit

struct Article: Decodable {
    let author: String?
    let title: String?
    let description: String?
}

struct AllArticles: Decodable {
    var totalResults: Int
    var articles: [Article]
}


class ViewController: UITableViewController {
    var articlearray = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString: String
        
        

        var category = ["technology", "business", "sports"]
        let current = Int.random(in: 0...2)
        title = category[current].uppercased()
        urlString = "https://newsapi.org/v2/top-headlines?country=us&category=\(category[current])&apiKey=d086c3952434488b85062cf7c879e6c4"
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
            }
        }
    }


    
    func parse(json: Data) {
        if let jsonArticles = try? JSONDecoder().decode(AllArticles.self, from: json) {
            articlearray = jsonArticles.articles
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articlearray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let article1 = articlearray[indexPath.row]
        cell.textLabel?.text = article1.title
        cell.detailTextLabel?.text = article1.author
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = articlearray[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

