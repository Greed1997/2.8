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
    @IBOutlet var congratulationsLabel: UILabel!
    @IBOutlet var disciplinesStackView: UIStackView!
    
    var allDisciplines = Discipline.allCases
    var discipline: Discipline!
    var delegate: SettingsDisciplineDelegate!
    var delegateTypeOfResult: SettingsTypeOfResultDelegate!
    var delegateGreatPerson: GreatPersonDelegate!
    var typeOfResult: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setTitle(for: philosophyButton, mathButton, physicButton)
        delegateTypeOfResult.setTypeOfResult(false)
    }
    @IBAction func disciplineButtonPressed(sender: UIButton) {
        delegate.setDiscipline(Discipline(rawValue: sender.currentTitle ?? "Физика") ?? .physic)
        delegateGreatPerson.setDiscipline(Discipline(rawValue: sender.currentTitle ?? "Физика") ?? .physic)
    }
    @IBAction func aboutCreators() {
        performSegue(withIdentifier: "creators", sender: hidesBottomBarWhenPushed = true)
    }
}
extension SettingsViewController {
    func setTitle(for buttons: UIButton...) {
        buttons.forEach{ button in
            switch button {
            case philosophyButton: philosophyButton.setTitle(Discipline.philosophy.rawValue, for: .normal)
                philosophyButton.layer.cornerRadius = philosophyButton.frame.height / 4
            case mathButton: mathButton.setTitle(Discipline.math.rawValue, for: .normal)
                mathButton.layer.cornerRadius = mathButton.frame.height / 4
            default: physicButton.setTitle(Discipline.physic.rawValue, for: .normal)
                physicButton.layer.cornerRadius = physicButton.frame.height / 4
            }
        }
    }
}
extension SettingsViewController {
    func setView() {
        if typeOfResult {
            disciplinesStackView.isHidden = true
        } else {
            congratulationsLabel.isHidden = true
        }
    }
}
