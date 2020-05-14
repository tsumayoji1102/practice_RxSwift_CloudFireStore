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
        
        let name = dic["name"] as! String
        var successFlg = true
        
        db.collection("profile").document(name).setData(dic)
        { err in
            if err != nil {
                print("\(String(describing: err))")
                successFlg = false
            }else{
                print("success: \(#function)")
                successFlg = true
            }
        }
        return successFlg
    }
    
    // 読み取り
    func readProfile(){
        
        let profileList = db.collection("profile").document()
        
    }

}
