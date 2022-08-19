//
//  TabBarViewController.swift
//  2.8
//
//  Created by Александр on 14.08.2022.
//

import UIKit
protocol TaskDisciplineDelegate {
    func setDiscipline(with newDiscipline: Discipline)
}
class TabBarViewController: UITabBarController {

    var discipline: Discipline!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        set()
    }
    

    
    func set() {
        guard let viewControllers = viewControllers else { return }
        guard let navigationVC = viewControllers.first as? UINavigationController else { return }
        guard let taskVC = navigationVC.topViewController as? TaskViewController else { return }
        guard let greatPersonsVC = viewControllers.last as? GreatPersonsViewController else { return }
        
        taskVC.discipline = discipline
        taskVC.delegateForGreatPerson = greatPersonsVC
    }

}
extension TabBarViewController: TaskDisciplineDelegate {
    func setDiscipline(with newDiscipline: Discipline) {
        discipline = newDiscipline
    }
}
