//
//  CreatorsCell.swift
//  2.8
//
//  Created by Александр on 10.09.2022.
//

import UIKit

class CreatorsCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var mailLabel: UILabel!
    @IBOutlet var photo: UIImageView!
    
    @IBOutlet var nameIconImage: UIImageView!
    @IBOutlet var phoneIconImage: UIImageView!
    @IBOutlet var mailIconImage: UIImageView!
    
    
    func setConfig(with creator: Creator) {
        nameLabel.text = creator.name
        phoneLabel.text = creator.phone ?? "88005553535 проще позвонить чем у кого-то занимать"
        mailLabel.text = creator.mail
        photo.image = UIImage(named: creator.name)
        
        nameIconImage.image = UIImage(systemName: "person.fill")
        phoneIconImage.image = UIImage(systemName: "phone.fill")
        mailIconImage.image = UIImage(systemName: "mail.fill")
    }
}
