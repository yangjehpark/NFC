//
//  AddViewController.swift
//  NFC
//
//  Created by YangJehPark on 2018. 6. 2..
//  Copyright © 2018년 YangJehPark. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        tabBarController?.tabBar.isHidden = true
    }
    
    func fail() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func next() {
        switch self {
        case is TaggingViewController:
            navigationController?.pushViewController(StoryboardHelper.getVC(CommunicatingViewController.self), animated: true)
        case is CommunicatingViewController:
            navigationController?.pushViewController(StoryboardHelper.getVC(ResultViewController.self), animated: true)
        case is ResultViewController:
            navigationController?.pushViewController(StoryboardHelper.getVC(AddFinalViewController.self), animated: true)
        case is AddFinalViewController:
            navigationController?.popToRootViewController(animated: false)
            tabBarController?.selectedIndex = 0
        default:
            log("The 'next()' error. (This is \(self.className))")
            break
        }
    }
    
    @objc func test() {
        next()
    }
}
