//
//  AddFinalViewController.swift
//  NFC
//
//  Created by YangJehPark on 2018. 6. 1..
//  Copyright © 2018년 YangJehPark. All rights reserved.
//

import UIKit
import Toaster

class AddFinalViewController: AddViewController {
    
    static let minimumSpace: CGFloat = 5
    static let numberOfCellInRow: Int = 6
    
    @IBOutlet weak var xButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var colorCollectionView: UICollectionView!

    var selectedColorIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            colorCollectionView.delegate = self
            colorCollectionView.dataSource = self
            colorCollectionView.registerCell(ColorCollectionCell.self)
        }
        do {
            nameTextField.delegate = self
        }
    }
    
    @IBAction func xButtonPressed(sender: UIButton) {
        sender.isEnabled = false
        fail()
    }
    
    @IBAction func doneButtonPressed(sender: UIButton) {
        sender.isEnabled = false
        guard let name = nameTextField.text, name != "" else {
            Toast(text: "Please enter the card name.").show()
            sender.isEnabled = true
            return
        }
        guard let color = selectedColorIndex else {
            Toast(text: "Please select the card color.").show()
            sender.isEnabled = true
            return
        }
        save(name, .red, nuid: "")
        Toast(text: "Saved").show()
        next()
    }
    
    private func save(_ name: String, _ color: UIColor, nuid: String) {
        
    }
}

extension AddFinalViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedColorIndex = indexPath.row
    }
}

extension AddFinalViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(ColorCollectionCell.self, indexPath)
        cell.setup(.red)
        return cell
    }
}

extension AddFinalViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return ColorCollectionCell.defaultSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return AddFinalViewController.minimumSpace
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return AddFinalViewController.minimumSpace
    }
}

extension AddFinalViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
