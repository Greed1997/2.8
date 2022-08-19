//
//  TaskViewController.swift
//  2.8
//
//  Created by Александр on 14.08.2022.
//

import UIKit


class TaskViewController: UIViewController {

    var discipline: Discipline!
    var delegateForGreatPerson: GreatPersonDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
}
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("\(self)")
    }

}
