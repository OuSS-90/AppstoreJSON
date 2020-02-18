//
//  AppSearchResult.swift
//  AppstoreJSON
//
//  Created by OuSS on 2/17/20.
//  Copyright © 2020 OuSS. All rights reserved.
//

import Foundation

struct AppSearchResult: Decodable {
    let resultCount: Int
    let results: [ResultData]
}

struct ResultData: Decodable {
    let trackName: String
    let primaryGenreName: String
    var averageUserRating: Float?
    let screenshotUrls: [String]
    let artworkUrl100: String // app icon
}
