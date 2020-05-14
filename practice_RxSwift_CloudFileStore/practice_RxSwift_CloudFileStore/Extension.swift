//
//  Extension.swift
//  practice_RxSwift_CloudFileStore
//
//  Created by 塩見陵介 on 2020/05/13.
//  Copyright © 2020 つまようじ職人. All rights reserved.
//

import UIKit

extension UITextField {
    
    // 下線
    func bottomLine(color: UIColor){
        let border = CALayer()
        
        border.frame = CGRect(x: 0, y: self.frame.height - 1, width: self.frame.width, height: 1)
        border.backgroundColor = color.cgColor
        self.layer.addSublayer(border)
    }
    
}
