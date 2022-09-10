//
//  Creators.swift
//  2.8
//
//  Created by Александр on 10.09.2022.
//

import Foundation

struct Creator {
    let name: String
    let phone: String?
    let mail: String
    
    static func getCreators() -> [Creator] {
        return CreatorsDataManager.shared.creators
    }
}
