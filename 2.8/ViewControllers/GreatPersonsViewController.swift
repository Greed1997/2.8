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

    private var currentDiscipline: Discipline!
    var discipline: Discipline!
    
    // MARK: - Сюда должна передаваться модель будет без инициализации каждый раз
    private var greatPersons: [[GreatPerson]] = []
    // MARK: - Позже додумать как удалиться от хардкодинга, экстеншин или гет добавить к енаму
    private let sectionNames = ["Философия", "Математика", "Физика"]
    private var personsDiscipline: [GreatPerson] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getInfoFromDataStorage()
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personsDiscipline.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch discipline {
        case .philosophy:
            return "Philosophy"
        case .math:
            return "Math"
        case .physic:
            return "Physic"
        default:
            return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "greatPerson", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let greatPerson = personsDiscipline[indexPath.row]
        
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
        switch discipline {
        case .philosophy:
            personsDiscipline = GreatPersonDataManager.shared.philosophers
        case .math:
            personsDiscipline = GreatPersonDataManager.shared.mathematicians
        case .physic:
            personsDiscipline = GreatPersonDataManager.shared.physicians
        default:
            break
        }
    }
}
