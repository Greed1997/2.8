//
//  DemiurgesViewController.swift
//  2.8
//
//  Created by Александр on 10.09.2022.
//

import UIKit

class DemiurgesViewController: UITableViewController {

    let demiurges = Creator.getCreators()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return demiurges.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "creators", for: indexPath) as! CreatorsCell
        cell.setConfig(with: demiurges[indexPath.row])
    
        return cell
    }
 
}
