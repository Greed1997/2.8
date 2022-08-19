//
//  SettingsViewController.swift
//  2.8
//
//  Created by Александр on 19.08.2022.
//

import UIKit
protocol SettingsDisciplineDelegate {
    func setDiscipline(_ newDiscipline: Discipline)
}
class SettingsViewController: UIViewController {
    var allDisciplines = Discipline.allCases
    var discipline: Discipline!
    @IBOutlet var philosophyButton: UIButton!
    @IBOutlet var mathButton: UIButton!
    @IBOutlet var physicButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtons(buttons: philosophyButton, mathButton, physicButton)
        
    }
    @IBAction func buttonPressed(sender: UIButton) {
        dismiss(animated: true)
    }

}
extension SettingsViewController: SettingsDisciplineDelegate {
    func setDiscipline(_ newDiscipline: Discipline) {
        discipline = newDiscipline
    }
    
    
}
extension SettingsViewController {
    func setButtons(buttons: UIButton...) {
        for button in buttons {
            button.titleLabel?.text = allDisciplines.removeFirst().rawValue
        }
    }
}
