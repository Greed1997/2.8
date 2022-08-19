//
//  SettingsViewController.swift
//  2.8
//
//  Created by Александр on 19.08.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    @IBOutlet var philosophyButton: UIButton!
    @IBOutlet var mathButton: UIButton!
    @IBOutlet var physicButton: UIButton!
    
    var allDisciplines = Discipline.allCases
    var discipline: Discipline!
    var delegate: SettingsDisciplineDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle(for: philosophyButton, mathButton, physicButton)
      //  physicButton.description = Discipline.physic.
    }
    @IBAction func disciplineButtonPressed(sender: UIButton) {
        delegate.setDiscipline(Discipline(rawValue: sender.titleLabel?.text ?? "Физика") ?? .physic)
    }

}
extension SettingsViewController {
    func setTitle(for buttons: UIButton...) {
        buttons.forEach{ button in
            switch button {
            case philosophyButton: philosophyButton.setTitle(Discipline.philosophy.rawValue, for: .normal)
            case mathButton: mathButton.setTitle(Discipline.math.rawValue, for: .normal)
            default: physicButton.setTitle(Discipline.physic.rawValue, for: .normal)
            }
        }
    }
}
