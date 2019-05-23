//
//  ViewController.swift
//  CustomTabbarControllerExample
//
//  Created by Meo MacBook Pro on 22/05/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func loadView() {
        view = BaseView()

        guard let ownView = view as? BaseView else {
            return
        }
  
        ownView.titleLabel.text = "First View"
    }

}

