//
//  DogAPI.swift
//  Randog
//
//  Created by June2020 on 4/27/21.
//

import Foundation

class DogAPI {
    enum Endpoint: String {
        case randomImageFromAllDogsCollection = "https://dog.ceo/api/breeds/image/random"
        
        var url: URL {
            return URL(string: self.rawValue)!
        }
    }
}
