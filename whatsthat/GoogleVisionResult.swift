//
//  GoogleVisionResult.swift
//  whatsthat
//
//  Created by Shaked Rotlevi on 11/20/17.
//  Copyright © 2017 gwu. All rights reserved.
//

import Foundation
struct GoogleVisionResult: Decodable {
    let name: String
   // let score: Double

    
    enum CodingKeys: String, CodingKey {
        case name //this matches above
         //case score //this matches above
    }
}
/*struct Root: Codable {
    
    let responses: [Responses]
    
}

struct Responses: Codable {
    
    let labelAnnotations: [LabelAnnotations]
    
}

struct LabelAnnotations: Codable {
    
    let mid: String
    let description: String
    let score: Double
    
}*/
