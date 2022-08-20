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
    
    private var greatPersons: [[GreatPerson]] = []
    // MARK: - Позже додумать как удалиться от хардкодинга, экстеншин или гет добавить к енаму
    private let sectionNames = ["Философия", "Математика", "Физика"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
        getInfoFromDataStorage()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        Discipline.allCases.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let discipline = greatPersons[section]
        return discipline.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sectionNames[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "greatPerson", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let discipline = greatPersons[indexPath.section]
        let greatPerson = discipline[indexPath.row]
        
        content.text = greatPerson.name
        content.image = UIImage(named: greatPerson.image)
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
    
    private func getInfoFromDataStorage() {
        greatPersons.append(GreatPersonDataManager.shared.philosophers)
        greatPersons.append(GreatPersonDataManager.shared.mathematicians)
        greatPersons.append(GreatPersonDataManager.shared.physicians)
    }
}
