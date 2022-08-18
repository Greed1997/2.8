//
//  GreatPersonsViewController.swift
//  2.8
//
//  Created by Александр on 14.08.2022.
//

import UIKit
protocol GreatPersonDelegate {
    func getDiscipline(_ newDiscipline: Discipline)
}
class GreatPersonsViewController: UITableViewController {

    var discipline: Discipline!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("\(self)")
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Discipline.allCases.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        let contact = Discipline.allCases[indexPath.row]
        
        content.text = contact.rawValue
        cell.contentConfiguration = content
        return cell
    }
    

}
extension GreatPersonsViewController: GreatPersonDelegate {
    func getDiscipline(_ newDiscipline: Discipline) {
     discipline = newDiscipline
    }
}
