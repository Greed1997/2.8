//
//  DisciplineViewController.swift
//  2.8
//
//  Created by Александр on 13.08.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class DisciplineViewController: UICollectionViewController {
    
    let disciplines = Discipline.allCases
    var discipline: Discipline!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTabBar" {
            guard let tabBarVC = segue.destination as? TabBarViewController else { return }
            tabBarVC.discipline = discipline
        }
    }

     // MARK: UICollectionViewDataSource

  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return disciplines.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! Cell
        
        cell.discipline.text = disciplines[indexPath.item].rawValue
        
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        discipline = disciplines[indexPath.item]
        performSegue(withIdentifier: "showTabBar", sender: nil)
    }
}
extension DisciplineViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: 100)
        }
}
