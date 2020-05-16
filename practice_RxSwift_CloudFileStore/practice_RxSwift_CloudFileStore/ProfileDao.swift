//
//  ProfileDao.swift
//  practice_RxSwift_CloudFileStore
//
//  Created by 塩見陵介 on 2020/05/14.
//  Copyright © 2020 つまようじ職人. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestoreSwift
import Foundation

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
    func readProfile(completion: @escaping(Array<Profile>) -> Void){
        
        db.collection("profile").getDocuments {
            snap, error in
            
            if(error != nil){
                print("error: \(String(describing: error))")
                return
            }
            
            if(snap == nil){
                print("failed: No Data")
                return
            }else{
                
                
                guard let data = snap?.count else{
                    print("dataなし")
                    return
                }
                var array = Array<Profile>()
                
                for document in snap!.documents {
                    let data = document.data()
                    let profile = Profile()
                    profile.name  = data["name"]  as! String
                    profile.sex   = data["sex"]   as! String
                    profile.hobby = data["hobby"] as! String
                    profile.cake  = data["cake"]  as! String
                    array.append(profile)
                }
                completion(array)
            }
        }
    }

}
