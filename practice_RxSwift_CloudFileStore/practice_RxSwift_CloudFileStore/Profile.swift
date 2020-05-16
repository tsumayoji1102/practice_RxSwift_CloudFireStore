//
//  Profile.swift
//  practice_RxSwift_CloudFileStore
//
//  Created by 塩見陵介 on 2020/05/15.
//  Copyright © 2020 つまようじ職人. All rights reserved.
//

import UIKit
import Foundation

class Profile: NSObject{
    
    override init() {
        self.name  = ""
        self.sex   = ""
        self.hobby = ""
        self.cake  = ""
        super.init()
    }
    
    var name:  String
    var sex:   String
    var hobby: String
    var cake:  String

}
