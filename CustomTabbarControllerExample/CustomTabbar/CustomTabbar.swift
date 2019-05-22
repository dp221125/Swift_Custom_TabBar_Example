//
//  CustomTabbar.swift
//  CustomTabbarControllerExample
//
//  Created by Meo MacBook Pro on 22/05/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class CustomTabbar: UIViewController {
    
    var homeVC: HomeViewController?
    var boomarkVC: BookMarkViewController?
    var mywriteVC: MyWriteHistoryViewController?
    var settingVC: SettingViewController?
    var vcList = [UIViewController]()
    var navi: UINavigationController?
    var prevIndex: Int?
    
    @objc func linkAction(sender: UIButton) {
        checkView()
        prevIndex = sender.tag
        moveView(index: sender.tag)
    }
    
    /// 새로운 뷰를 만들기 전에 기본의 뷰가 있으면 그 뷰를 제거한다.
    func checkView() {
        
        guard let prevSelectedIndex = prevIndex else {
            return
        }
  
        navi?.willMove(toParent: nil)
        navi?.view.removeFromSuperview()
        navi?.removeFromParent()
        
        vcList[prevSelectedIndex].willMove(toParent: nil)
        vcList[prevSelectedIndex].view.removeFromSuperview()
        vcList[prevSelectedIndex].removeFromParent()
        
    }
    
    /// 새로운 뷰로 이동한다.
    func moveView(index: Int) {
        
        guard let targetView = view as? CustomTabbarView else {
            return
        }
        
        addChild(vcList[index])
        vcList[index].view.frame = targetView.contentView.bounds

        navi = UINavigationController(rootViewController: vcList[index])
        navi?.navigationBar.barTintColor = UIColor(red:0.35, green:0.42, blue:0.75, alpha:1.0)
        navi?.navigationBar.tintColor = .white

        targetView.contentView.addSubview(navi!.view)
        vcList[index].didMove(toParent: self)
    }
    
    ///최초 화면을 불러온다. 최초화면은 0번 인덱스를 가진 화면.
    func firstScreen() {
        moveView(index: 0)
        prevIndex = 0
    }
    
    ///각 탭바의 아이템들을 액션에 연결한다.
    func linkTargetAction() {
        
        guard let targetView = view as? CustomTabbarView else {
            return
        }
        
        targetView.leftStack.firstButton.addTarget(self, action: #selector(linkAction), for: .touchUpInside)
        targetView.leftStack.secondButton.addTarget(self, action: #selector(linkAction), for: .touchUpInside)
        targetView.rightStack.firstButton.addTarget(self, action: #selector(linkAction), for: .touchUpInside)
        targetView.rightStack.secondButton.addTarget(self, action: #selector(linkAction), for: .touchUpInside)
        
    }
    
    func makeViewList() {
        guard let views = [homeVC, boomarkVC, mywriteVC, settingVC] as? [UIViewController] else {
            return
        }
        
        vcList = views

    }
    
    override func loadView() {
        view = CustomTabbarView()
        
        homeVC = HomeViewController()
        boomarkVC = BookMarkViewController()
        mywriteVC = MyWriteHistoryViewController()
        settingVC = SettingViewController()
        
        makeViewList()
        linkTargetAction()
        firstScreen()
    }
}
