//
//  NavigationViewController.swift
//  2.8
//
//  Created by Александр on 14.08.2022.
//

import UIKit
protocol NavigationDisciplineDelegate {
    func setDiscipline(with newDiscipline: Discipline)
}

class NavigationViewController: UINavigationController {

    var discipline: Discipline!
    var delegateForGreatPerson: GreatPersonDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("\(self)")
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let taskVC = segue.destination as? TaskViewController else { return }
        taskVC.discipline = discipline
        
    }
    

}
extension NavigationViewController: NavigationDisciplineDelegate {
    func setDiscipline(with newDiscipline: Discipline) {
        discipline = newDiscipline
    }
}
