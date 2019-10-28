//
//  DetailViewController.swift
//  twofourseven
//
//  Created by Nikhil Anu on 5/27/19.
//  Copyright © 2019 Nikhil Anu. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var webView: WKWebView!
    var detailItem: Article?

    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let detailItem = detailItem else {return}
        
        let html = """
        
        <html>
        <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style> body { font-size: 150%; } </style>
        </head>
        <body>
        <font face = "arial">
        <h2>\(detailItem.title!.uppercased())</h2>
        \(detailItem.description!)
        </font>
        </body>
        </html>
        """
        webView.loadHTMLString(html, baseURL: nil)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
