//
//  AboutTableViewController.swift
//  2.8
//
//  Created by Eugenie Tyan on 09.09.2022.
//

import UIKit

class AboutTableViewController: UITableViewController {
    
    let creators = CreatorsDataMangaer.shared.creators
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        creators.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        creators[section].responsibilities
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "creatorCell", for: indexPath)
        let creator = creators[indexPath.section]
        var content = cell.defaultContentConfiguration()
        content.textProperties.font = UIFont.systemFont(ofSize: 13)
        switch indexPath.row {
        case 0:
            content.image = UIImage(named: creator.imageURL) ?? UIImage(named: "placeholder")
            content.text = creator.fullName
            content.textProperties.font = UIFont.boldSystemFont(ofSize: 17)
            tableView.rowHeight = 80
        case 1:
            content.image = UIImage(named: "phone")
            content.text = creator.phoneNumber
            tableView.rowHeight = 35
        case 2:
            content.image = UIImage(named: "email")
            content.text = creator.email
            tableView.rowHeight = 35
        default:
            break
        }
        let imageSize = tableView.rowHeight * 0.8
        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        content.imageProperties.maximumSize.height = imageSize
        content.imageProperties.maximumSize.width = imageSize
        
        cell.contentConfiguration = content

        return cell
    }

    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        nil
    }
}
