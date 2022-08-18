//
//  TabBarViewController.swift
//  2.8
//
//  Created by Александр on 14.08.2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    var discipline: Discipline!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewControllers = viewControllers else { return }
        guard let navigationVC = viewControllers.first as? NavigationViewController else { return }
        guard let greatPersonsVC = viewControllers.last as? GreatPersonsViewController else { return }
        
        navigationVC.discipline = discipline
        navigationVC.delegateForGreatPerson = greatPersonsVC
    }
    

}
