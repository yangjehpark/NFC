//
//  ManageViewController.swift
//  NFC
//
//  Created by YangJehPark on 2018. 6. 1..
//  Copyright © 2018년 YangJehPark. All rights reserved.
//

import UIKit

class ManageViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var leftButtonItem: UIBarButtonItem!
    @IBOutlet weak var rightButtonItem: UIBarButtonItem!
    
    enum Section: Int {
        case NoItem = 0
        case IsItem = 1
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerCells([ManageItemCell.self, ManageNoItemCell.self])
        tableView.separatorStyle = .none
        leftButtonItem.tintColor = Util.colorMain
        rightButtonItem.tintColor = Util.colorMain
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
        tabBarController?.tabBar.isHidden = false
        
        leftButtonItem.isEnabled = UserDataManager.shared.dataCount != 0
        tableView.isScrollEnabled = UserDataManager.shared.dataCount != 0
        tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if tableView.isEditing {
            tableView.setEditing(false, animated: false)
        }
    }
    
    @IBAction func editButtonPressed() {
        leftButtonItem.title = tableView.isEditing ? "Edit" : "Done"
        rightButtonItem.isEnabled = tableView.isEditing
        tableView.setEditing(!tableView.isEditing, animated: true)
    }
    
    @IBAction func addButtonPressed() {
        navigationController?.pushViewController(StoryboardHelper.getVC(TaggingViewController.self), animated: true)
    }
}

extension ManageViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case Section.NoItem.rawValue:
            return UserDataManager.shared.dataCount == 0 ? 1 : 0
        case Section.IsItem.rawValue:
            return UserDataManager.shared.dataCount
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case Section.NoItem.rawValue:
            return tableView.dequeueCell(ManageNoItemCell.self, indexPath)!
        case Section.IsItem.rawValue:
            let cell = tableView.dequeueCell(ManageItemCell.self, indexPath)!
            cell.setup(.red)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        switch indexPath.section {
        case Section.NoItem.rawValue:
            return false
        case Section.IsItem.rawValue:
            return tableView.isEditing
        default:
            return false
        }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        switch indexPath.section {
        case Section.NoItem.rawValue:
            return .none
        case Section.IsItem.rawValue:
            return .delete
        default:
            return .none
        }
    }

    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        switch indexPath.section {
        case Section.NoItem.rawValue:
            return false
        case Section.IsItem.rawValue:
            return true
        default:
            return false
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        log("moveRowAt source-\(sourceIndexPath),destination-\(destinationIndexPath)")
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        log("commit indexPath-\(indexPath),editingStyle=\(editingStyle.rawValue)")
        //case none = 0
        //case delete
        //case insert
    }
}

extension ManageViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case Section.NoItem.rawValue:
            return ManageNoItemCell.defaultHeight
        case Section.IsItem.rawValue:
            return ManageItemCell.defaultHeight
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case Section.NoItem.rawValue:
            break
        case Section.IsItem.rawValue:
            log("(didSelectRowAt-\(indexPath))")
            // Show info view
            
        default:
            break
        }
    }
}
