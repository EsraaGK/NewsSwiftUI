//
//  Response.swift
//  News
//
//  Created by EsraaGK on 3/23/21.
//

import Foundation

struct Response : Codable {
    let status : String?
    let totalResults : Int?
    let articles : [Article]?
}

struct Article: Codable {
    var id: Int?
    let source: Source?
    let author : String?
    let title : String?
    let description : String?
    let url : String?
    let urlToImage : String?
    let publishedAt : String?
    let content : String?
}

struct Source : Codable {
    let id : String?
    let name : String?
}
