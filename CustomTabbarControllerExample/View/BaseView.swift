//
//  baseView.swift
//  CustomTabbarControllerExample
//
//  Created by Meo MacBook Pro on 22/05/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

/**
 각 뷰의 기본뷰
 이 뷰를 기본뷰로 삼고 TitleLabel에 뷰 이름 출력
 */
class BaseView: UIView {
    
    let titleLabel: UILabel = {
        return UILabel()
    }()
    
    /// TitleLabel의 AutoLayout 설정
    func makeTitleLableConstraint() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        makeTitleLableConstraint()
    }

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    

}
