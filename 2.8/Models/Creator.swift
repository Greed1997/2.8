//
//  Creator.swift
//  2.8
//
//  Created by Eugenie Tyan on 09.09.2022.
//

struct Creator {
    let name: String
    let surname: String
    let imageURL: String
    let phoneNumber: String
    let email: String
    let responsibilities: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
}
