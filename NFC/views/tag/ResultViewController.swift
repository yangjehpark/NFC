//
//  ResultViewController.swift
//  NFC
//
//  Created by YangJehPark on 2018. 6. 1..
//  Copyright © 2018년 YangJehPark. All rights reserved.
//

import UIKit
import Toaster

class ResultViewController: AddViewController {
    
    var isSuccess: Bool = true
    var tagInfoList: [String: String] = ["NUID":"1", "Tag type":"2", "ATQA":"3", "SAK":"4"]
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var stateImageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var infoTableView: UITableView!
    
    @IBOutlet weak var failButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            infoTableView.delegate = self
            infoTableView.dataSource = self
            infoTableView.separatorStyle = .none
            infoTableView.registerCell(TagInfoCell.self)
        }
        do {
            failButton.isHidden = isSuccess
            failButton.setTitle("Back", for: .normal)
        }
        do {
            saveButton.isHidden = !isSuccess
            saveButton.setTitle("Next", for: .normal)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if isSuccess {
            titleLabel.text = "Success"
            messageLabel.text = "Please press the next button for making a virtual card."
        } else {
            titleLabel.text = "Fail"
            messageLabel.text = "'fail reason here'"
        }
    }
    
    @IBAction func failButtonPressed(sender: UIButton) {
        sender.isEnabled = false
        fail()
    }
    
    @IBAction func xButtonPressed(sender: UIButton) {
        sender.isEnabled = false
        fail()
    }
    
    @IBAction func saveButtonPressed(sender: UIButton) {
        sender.isEnabled = false
        next()
    }
}

extension ResultViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tagInfoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueCell(TagInfoCell.self, indexPath), let tagInfo = Array(tagInfoList)[safe: indexPath.row] {
            cell.setup(tagInfo.key, tagInfo.value)
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

extension ResultViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let taginfoValue = Array(tagInfoList)[safe: indexPath.row]?.value {
            UIPasteboard.general.string = taginfoValue
            Toast(text: "Copied to clipboard :"+"\n"+"\(taginfoValue)", delay: 0, duration: 1).show()
        }
    }
}
