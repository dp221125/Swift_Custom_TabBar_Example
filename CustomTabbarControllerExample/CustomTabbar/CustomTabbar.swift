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
    var prevIndex: Int?
    
    @objc func linkAction(_ sender: UIButton) {
        checkView()
        prevIndex = sender.tag
        moveView(sender.tag)
    }
    
    /// 새로운 뷰를 만들기 전에 기본의 뷰가 있으면 그 뷰를 제거한다.
    func checkView() {
        
        guard let prevSelectedIndex = prevIndex else {
            return
        }

        vcList[prevSelectedIndex].willMove(toParent: nil)
        vcList[prevSelectedIndex].view.removeFromSuperview()
        vcList[prevSelectedIndex].removeFromParent()
        
    }
    
    /// 새로운 뷰로 이동한다.
    func moveView(_ index: Int) {
        
        guard let targetView = view as? CustomTabbarView else {
            return
        }
       
        addChild(vcList[index])
        vcList[index].view.frame = targetView.contentView.bounds
        targetView.contentView.addSubview(vcList[index].view)
        vcList[index].didMove(toParent: self)
    }
    
    @objc func moveWriteView() {

        let writeView = WriteViewController()
        present(writeView,animated: true)
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

        targetView.centerButton.addTarget(self, action: #selector(moveWriteView), for: .touchUpInside)
        
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
    }
    
    /// 뷰가 로딩이 다 되고 난 뒤 기본 뷰를 셋팅한다.
    override func viewDidAppear(_ animated: Bool) {
        
        if prevIndex == nil {
            prevIndex = 0
            moveView(0)
        }
    }
    

}
