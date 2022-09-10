//
//  GreatPersonsViewController.swift
//  2.8
//
//  Created by Александр on 14.08.2022.
//

import UIKit
protocol GreatPersonDelegate {
    func setDiscipline(_ newDiscipline: Discipline)
}
class GreatPersonsViewController: UITableViewController {

    var discipline: Discipline!
    private var greatPersons: [GreatPerson] {
        GreatPerson.getGreatPersons(discipline)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
        tableView.tableFooterView = UIView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        greatPersons.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        discipline.rawValue
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "greatPerson", for: indexPath)
        var content = cell.defaultContentConfiguration()

        
        content.text = greatPersons.map({ $0.name })[indexPath.row]
        content.image = UIImage(named: greatPersons.map({ $0.image })[indexPath.row])
        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        content.imageProperties.maximumSize.height = tableView.rowHeight
        content.imageProperties.maximumSize.width = tableView.rowHeight
        
        cell.contentConfiguration = content
        return cell
    }
    

}
extension GreatPersonsViewController: GreatPersonDelegate {
    func setDiscipline(_ newDiscipline: Discipline) {
     discipline = newDiscipline
    }
}
