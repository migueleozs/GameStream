//
//  Models.swift
//  GameStream
//
//  Created by Miguel Zamudio on 20/11/2024.
//

import Foundation


struct Games: Codable {
    var games: [Game]
    
}


struct Resultados: Codable {
    var results: [Game]
    
}

//Tiene que ser Codable para que conforme con Games
struct Game:Codable,Hashable {
    
    var title: String
    var studio: String
    var contentRaiting: String
    var publicationYear: String
    var description : String
    var platforms : [String]
    var tags : [String]
    var videosUrls : videoUrl
    var galleryImages : [String]
}

//las estructuras modelan los JSON

struct videoUrl: Codable,Hashable {
    var mobile : String
    var tablet : String
}
