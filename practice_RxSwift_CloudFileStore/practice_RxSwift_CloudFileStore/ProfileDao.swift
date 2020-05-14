//
//  ProfileDao.swift
//  practice_RxSwift_CloudFileStore
//
//  Created by 塩見陵介 on 2020/05/14.
//  Copyright © 2020 つまようじ職人. All rights reserved.
//

import UIKit
import Firebase

class ProfileDao: NSObject {
    
    let db = Firestore.firestore()
    
    override init() {
        super.init()
    }
    
    func createProfile(dic: Dictionary<String, Any>) -> Bool{
        
        
        
        return true
    }

}
