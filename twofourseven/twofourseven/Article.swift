//
//  Article.swift
//  twofourseven
//
//  Created by Nikhil Anu on 5/27/19.
//  Copyright © 2019 Nikhil Anu. All rights reserved.
//

import Foundation

struct NewsSource: Codable {
    let status: String?
    let totalResults: Int?
    struct Article: Codable {
        let source: Source
        let author: String?
        let title: String?
        let description: String?
        let url: URL?
        let urlToImage: URL?
        let publishedAt: Date
        
        struct Source: Codable {
            let id: String?
            let name: String?
        }
    }
}
