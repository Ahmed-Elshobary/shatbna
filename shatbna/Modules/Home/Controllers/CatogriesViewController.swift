//
//  CatogriesViewController.swift
//  shatbna
//
//  Created by ahmed elshobary on 28/12/2022.
//

import UIKit

class CatogriesViewController: UIViewController {

    //MARK: - Outlet
    
    @IBOutlet var catogriesCollectionView: [UIButton]!
    
    //MARK: - Actions
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()

    }

    private func setupViews(){
        for item in catogriesCollectionView {
            item.layer.cornerRadius = 12
            item.layer.borderColor = UIColor.gray.cgColor
            item.layer.borderWidth = 1
            item.clipsToBounds = true
        }
        catogriesCollectionView[0].layer.borderColor = YellowColor.cgColor
    }
}
extension CatogriesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellVC = collectionView.dequeueReusableCell(withReuseIdentifier: "IndicatorsCustomCellID", for: indexPath) as! IndicatorsCustomCell
        if indexPath.item == 0 {
            cellVC.backgroundColor = YellowColor
        } else{
            cellVC.backgroundColor = UIColor.black
        }
        return cellVC
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 20, height: 3)
    }
}
