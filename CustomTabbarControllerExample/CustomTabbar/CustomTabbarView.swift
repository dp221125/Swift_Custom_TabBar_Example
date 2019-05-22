//
//  CustomTabbar.swift
//  CustomTabbarControllerExample
//
//  Created by Meo MacBook Pro on 22/05/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class CustomTabbarView: UIView {
    
    let contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        return contentView
    }()
    
    let customTabBar: UITabBar = {
        let customTabBar = UITabBar()
        customTabBar.barTintColor = UIColor(red:0.35, green:0.42, blue:0.75, alpha:1.0)
        customTabBar.tintColor = UIColor.white
        return customTabBar
    }()
    
    func makeContentViewConstraint() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: centerYAnchor),
            contentView.widthAnchor.constraint(equalTo: widthAnchor),
            contentView.heightAnchor.constraint(equalTo: heightAnchor)
            ])
    }
    
    func makeCustomTabBarConstraint() {
        customTabBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customTabBar.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            customTabBar.centerXAnchor.constraint(equalTo: centerXAnchor),
            customTabBar.widthAnchor.constraint(equalTo: widthAnchor),
            ])
        
    }
    
    let leftStack: ButtonStack = {
        return ButtonStack()
    }()
    
    let rightStack: ButtonStack = {
        return ButtonStack()
    }()
    
    func makeStackConstraint(targetStack: UIView) {
        targetStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            targetStack.heightAnchor.constraint(equalTo: customTabBar.heightAnchor),
            targetStack.widthAnchor.constraint(equalTo: customTabBar.widthAnchor,multiplier: 0.3),
            targetStack.centerYAnchor.constraint(equalTo: customTabBar.centerYAnchor)
            ])
    }
    
    func makeLeftStackConstraint() {
        leftStack.leadingAnchor.constraint(equalTo: customTabBar.leadingAnchor,constant: 16).isActive = true
    }
    
    func makeRightStackConstraint() {
        rightStack.trailingAnchor.constraint(equalTo: customTabBar.trailingAnchor,constant: -16).isActive = true
    }
    
    func makeView() {
        backgroundColor = .white
        addSubview(contentView)
        addSubview(customTabBar)
        makeCustomTabBarConstraint()
        addSubview(leftStack)
        makeStackConstraint(targetStack: leftStack)
        makeLeftStackConstraint()
        addSubview(rightStack)
        makeStackConstraint(targetStack: rightStack)
        makeRightStackConstraint()
    }
    
    func makeLabelTitle() {
        
        leftStack.firstButton.setTitle("홈", for: .normal)
        leftStack.secondButton.setTitle("즐찾", for: .normal)

        rightStack.firstButton.setTitle("나의글", for: .normal)
        rightStack.secondButton.setTitle("설정", for: .normal)
    }
    
    func linkTagNumber() {
        leftStack.firstButton.tag = 0
        leftStack.secondButton.tag = 1
        rightStack.firstButton.tag = 2
        rightStack.secondButton.tag = 3
    }
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        makeView()
        makeLabelTitle()
        linkTagNumber()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

class ButtonStack: UIView {
    
    let buttonStackView: UIStackView = {
        let buttonStackView = UIStackView()
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        return buttonStackView
    }()
    
    let firstButton: UIButton = {
        return UIButton()
    }()
    
    let secondButton: UIButton = {
        return UIButton()
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(buttonStackView)
        
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonStackView.widthAnchor.constraint(equalTo: widthAnchor),
            buttonStackView.heightAnchor.constraint(equalTo: heightAnchor),
            buttonStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            ])
        
        buttonStackView.addArrangedSubview(firstButton)
        buttonStackView.addArrangedSubview(secondButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
