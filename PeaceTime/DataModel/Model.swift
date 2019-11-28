//
//  Model.swift
//  PeaceTime
//
//  Created by Blue Star on 11/29/19.
//  Copyright © 2019 Guillermo Olmedo. All rights reserved.
//

import Foundation

struct ImageCellModel {
    var title: String
    var imageName: String
}

struct ContentModel {
    var category: String
    var content: [ImageCellModel]
}

enum Level {
    case low
    case medium
    case high
}

class DataModel {
    static let shared = DataModel()
    private var contentData: [ContentModel]
    
    init() {
        contentData = [
            ContentModel(category: "Featured Articles",
                         content: [
                            ImageCellModel(title: "Lotus Focus", imageName: "featured-1"),
                            ImageCellModel(title: "Peaceful Thoughts: How to", imageName: "featured-2"),
                            ImageCellModel(title: "Desert", imageName: "featured-3")
                ]
            ),
            ContentModel(category: "Topics",
                         content: [
                            ImageCellModel(title: "Peace", imageName: "topics-1"),
                            ImageCellModel(title: "Balance", imageName: "topics-2"),
                            ImageCellModel(title: "Beautiful Night", imageName: "topics-3")
                ]
            ),
            ContentModel(category: "Time to Read",
                         content: [
                            ImageCellModel(title: "5 min", imageName: "read-1"),
                            ImageCellModel(title: "10 min", imageName: "read-2"),
                            ImageCellModel(title: "15 min", imageName: "read-3")
                ]
            )
        ]
    }
    
    func getContentData() -> [ContentModel] {
        return contentData
    }
}
