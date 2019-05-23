//
//  WriteViewController.swift
//  CustomTabbarControllerExample
//
//  Created by Meo MacBook Pro on 23/05/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class WriteViewController: UIViewController {
    
    let button: UIButton = {
        return UIButton()
    }()
    
    @objc func moveParentView() {
        self.dismiss(animated: true)
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        view.addSubview(button)
        button.setTitle("Write View", for: .normal)
        button.backgroundColor = UIColor(named: "SkyBlue")
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.heightAnchor.constraint(equalTo: button.widthAnchor)
            ])
        
        
        button.addTarget(self, action: #selector(moveParentView), for: .touchUpInside)
    }
}
